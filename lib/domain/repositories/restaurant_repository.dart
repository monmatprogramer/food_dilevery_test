import 'package:di_tutorail_app/domain/entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> getRestaurants();
  Future<List<Restaurant>> getFeaturedRestaurants();
  Future<List<Restaurant>> getRestaurantsByCategory(int categoryId);
}
