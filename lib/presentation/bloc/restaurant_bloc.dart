import 'package:di_tutorail_app/domain/usecases/get_featured_restaurants.dart';
import 'package:di_tutorail_app/domain/usecases/get_restaurants.dart';
import 'package:di_tutorail_app/domain/usecases/get_restaurants_by_category.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_event.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurants getRestaurants;
  final GetFeaturedRestaurants getFeaturedRestaurants;
  final GetRestaurantsByCategory getRestaurantsByCategory;
  RestaurantBloc(
      {required this.getRestaurants,
      required this.getFeaturedRestaurants,
      required this.getRestaurantsByCategory})
      : super(RestaurantInitial()) {
    on<GetRestaurantsEvent>(_onGetRestaurants);
    on<GetFeaturedRestaurantsEvent>(_onGetFeaturedRestaurants);
    on<GetRestaurantsByCategoryEvent>(_onGetRestaurantsByCategory);
  }
  // Handler to get restaurant List<restaurant>
  Future<void> _onGetRestaurants(
      GetRestaurantsEvent event, Emitter<RestaurantState> emit) async {
    emit(RestaurantLoading());
    try {
      final restaurants = await getRestaurants();
      //[Instance of 'Restaurant', Instance of 'Restaurant', Instance of 'Restaurant']
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError(message: "Failed to fetch restaurants."));
    }
  }

  Future<void> _onGetFeaturedRestaurants(
      GetFeaturedRestaurantsEvent event, Emitter<RestaurantState> emit) async {
    emit(RestaurantLoading());
    try {
      final restaurants = await getFeaturedRestaurants();
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError(message: "Failed to fetch featured restaurants."));
    }
  }

  Future<void> _onGetRestaurantsByCategory(GetRestaurantsByCategoryEvent event,
      Emitter<RestaurantState> emit) async {
    emit(RestaurantLoading());
    try {
      final restaurants = await getRestaurantsByCategory(event.categoryId);
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError(message: 'Failed to fetch restaurants by category'));
    }
  }
}
