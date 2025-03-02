import 'package:di_tutorail_app/domain/entities/restaurant.dart';
import 'package:di_tutorail_app/domain/repositories/restaurant_repository.dart';

class GetRestaurants {
  final RestaurantRepository repository;
  const GetRestaurants(this.repository);
  Future<List<Restaurant>> call() => repository.getRestaurants();
  
}
