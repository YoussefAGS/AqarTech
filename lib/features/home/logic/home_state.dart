part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded({
    required List<ApartmentModel> topRated,
    required List<ApartmentModel> mostVisited,
    required List<Review> reviews,
    required Offer offers,  // Add offers to the state
    String? errorMessage,  // Optional error message
  }) = HomeLoaded;
  const factory HomeState.error({required String message}) = HomeError;
}