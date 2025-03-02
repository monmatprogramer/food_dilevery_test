import 'package:di_tutorail_app/domain/entities/restaurant.dart';
import 'package:di_tutorail_app/domain/repositories/restaurant_repository.dart';

class GetFeaturedRestaurants {
  final RestaurantRepository repository;
  const GetFeaturedRestaurants(this.repository);

  Future<List<Restaurant>>call() => repository.getFeaturedRestaurants();
}
