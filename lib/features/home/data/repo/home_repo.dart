
import 'package:aqartech/core/networking/api_error_handler.dart';
import 'package:aqartech/core/networking/api_result.dart';
import 'package:aqartech/features/home/data/data_source/home_data_source.dart';
import 'package:aqartech/features/home/data/models/Offer.dart';
import 'package:aqartech/features/home/data/models/apartment_model.dart';
import 'package:aqartech/features/home/data/models/review.dart';
class HomeRepository  {
  final HomeDataSource _apiHomeService;

  HomeRepository(this._apiHomeService);


  Future<ApiResult<List<ApartmentModel>>> fetchTopRated({required String lang,required int page,required int limit}) async {
    try {
      final response = await _apiHomeService.fetchTopRated(lang: lang,page: page,limit: limit);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<ApartmentModel>>> fetchMostVisited({required String lang}) async {
    try {
      final response = await _apiHomeService.fetchMostVisited(lang: lang);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<Review>>> fetchReviews({required String lang}) async {
    try {
      final response = await _apiHomeService.fetchReviews(lang: lang);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<Offer>> fetchOffers({required String lang}) async {
    try {
      final response = await _apiHomeService.fetchOffers(lang: lang);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
