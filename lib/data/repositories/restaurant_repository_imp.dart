import 'package:di_tutorail_app/domain/entities/restaurant.dart';
import 'package:di_tutorail_app/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImp implements RestaurantRepository {
  final duration = const Duration(microseconds: 800);
  @override
  Future<List<Restaurant>> getFeaturedRestaurants() async {
    await Future.delayed(duration);
    return [
      Restaurant(id: 1, name: 'Burger King', rating: 4.2),
      Restaurant(id: 4, name: 'McDonalds', rating: 4.1),
    ];
  }

  @override
  Future<List<Restaurant>> getRestaurants() async {
    await Future.delayed(duration);
    return [
      Restaurant(id: 1, name: 'Burger King', rating: 4.2),
      Restaurant(id: 2, name: 'Pizza Hut', rating: 4.0),
      Restaurant(id: 3, name: 'Taco Bell', rating: 3.8),
      Restaurant(id: 2, name: 'Sushi Delight', rating: 4.5),
      Restaurant(id: 3, name: 'Pasta Heaven', rating: 4.2),
      Restaurant(id: 4, name: 'Taco Bell', rating: 3.8),
      Restaurant(id: 5, name: 'Burger Bliss', rating: 4.0),
      Restaurant(id: 6, name: 'Pizza Paradise', rating: 4.3),
      Restaurant(id: 7, name: 'Curry Corner', rating: 4.1),
      Restaurant(id: 8, name: 'Noodle Nook', rating: 4.6),
      Restaurant(id: 9, name: 'BBQ Haven', rating: 4.4),
      Restaurant(id: 10, name: 'Vegan Bistro', rating: 4.0),
      Restaurant(id: 11, name: 'Dim Sum Delight', rating: 4.5),
    ];
  }

  @override
  Future<List<Restaurant>> getRestaurantsByCategory(int categoryId) async {
    await Future.delayed(duration);
    if (categoryId == 1) {
      return [
        Restaurant(id: 1, name: 'Burger King', rating: 4.2),
        Restaurant(id: 4, name: 'McDonalds', rating: 4.1),
      ];
    } else {
      return [
        Restaurant(id: 2, name: 'Pizza Hut', rating: 4.0),
        Restaurant(id: 3, name: 'Taco Bell', rating: 3.8),
      ];
    }
  }
}
