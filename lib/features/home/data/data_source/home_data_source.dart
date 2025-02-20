import 'package:aqartech/features/home/data/models/Offer.dart';
import 'package:aqartech/features/home/data/models/apartment_model.dart';
import 'package:aqartech/features/home/data/models/review.dart';

abstract class HomeDataSource {
  Future<List<ApartmentModel>> fetchTopRated({required String lang,required int page,required int limit});
  Future<List<ApartmentModel>> fetchMostVisited({required String lang});
  Future<List<Review>> fetchReviews({required String lang});
  // Future<List<ApartmentModel>> fetchOffers();
  Future<Offer> fetchOffers({required String lang});


}