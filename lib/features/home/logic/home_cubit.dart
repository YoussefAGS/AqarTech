import 'package:aqartech/core/common/constants.dart';
import 'package:aqartech/core/common/shared_pref_helper.dart';
import 'package:aqartech/features/home/data/models/Offer.dart';
import 'package:aqartech/features/home/data/models/apartment_model.dart';
import 'package:aqartech/features/home/data/models/review.dart';
import 'package:aqartech/features/home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState.initial());

  Future<void> fetchHomeData() async {
    emit(const HomeState.loading());
    String lang = 'en';
    lang =await SharedPrefHelper.getString(SharedPrefKeys.language)??'en';

    try {
      final results = await Future.wait([
        _homeRepository.fetchTopRated(lang:lang,page: 1,limit: 2),
        _homeRepository.fetchMostVisited(lang:lang),
        _homeRepository.fetchReviews(lang:lang),
        _homeRepository.fetchOffers(lang:lang),
      ]);
      if(isClosed)return;

      List<ApartmentModel> topRated = [];
      List<ApartmentModel> mostVisited = [];
      List<Review> reviews = [];
      Offer offers = Offer( '', '');
      String errorMessage='';

      results[0].when(
        success: (data) => topRated = (data as List<ApartmentModel>),
        failure: (error) => errorMessage = error.apiErrorModel.message ?? 'Failed to load top rated',
      );

      results[1].when(
        success: (data) => mostVisited = (data as List<ApartmentModel>),
        failure: (error) => errorMessage = error.apiErrorModel.message ?? 'Failed to load most visited',
      );

      results[2].when(
        success: (data) => reviews = (data as List<Review>),
        failure: (error) => errorMessage = error.apiErrorModel.message ?? 'Failed to load reviews',
      );

      results[3].when(
        success: (data) => offers = (data as Offer),
        failure: (error) => errorMessage = error.apiErrorModel.message ?? 'Failed to load offers',
      );

      if (topRated.isEmpty && mostVisited.isEmpty && reviews.isEmpty && (offers.title!.isEmpty&&offers.description!.isEmpty)&& errorMessage.isNotEmpty) {
        emit( HomeState.error(message:errorMessage ));
      } else {
        emit(HomeState.loaded(
          topRated: topRated,
          mostVisited: mostVisited,
          reviews: reviews,
          offers: offers,
        ));
      }
    } catch (e) {
      emit(HomeState.error(message: 'Something went wrong: $e'));
    }
  }
}

