import 'package:aqartech/features/home/data/data_source/home_data_source.dart';
import 'package:aqartech/features/home/data/models/Offer.dart';
import 'package:aqartech/features/home/data/models/apartment_model.dart';
import 'package:aqartech/features/home/data/models/review.dart';
import 'package:dio/dio.dart';
import 'package:aqartech/core/networking/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_home_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiHomeService extends HomeDataSource {
  factory ApiHomeService(Dio dio, {String baseUrl}) = _ApiHomeService;
@override
  @GET(
      "/v1/home/top-rated-apartments?limit={limit}&page={page}&locale={lang}")
  Future<List<ApartmentModel>> fetchTopRated(
      {@Path('lang') required String lang,@Path('page') required int page, @Path('limit') required int limit});
  @override

  @GET("/v1/home/most-visited-apartments?limit=10&page=1&locale={lang}")
  Future<List<ApartmentModel>> fetchMostVisited(
      {@Path('lang') required String lang});
  @override

  @GET("/v1/home/apartments-reviews?limit=5&page=1&locale={lang}")
  Future<List<Review>> fetchReviews({@Path('lang') required String lang});
  @override
  @override

  @GET("/v1/home/offer-content?locale={lang}")
  Future<Offer> fetchOffers(
      {@Path('lang') required String lang});
}
