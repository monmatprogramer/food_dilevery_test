import 'package:di_tutorail_app/domain/entities/restaurant.dart';
import 'package:di_tutorail_app/domain/repositories/restaurant_repository.dart';

class GetRestaurantsByCategory {
  final RestaurantRepository repository;
  const GetRestaurantsByCategory(this.repository);

  Future<List<Restaurant>> call(int categoryId) => repository.getRestaurantsByCategory(categoryId);
}
