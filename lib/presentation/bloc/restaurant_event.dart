import 'package:equatable/equatable.dart';

abstract class RestaurantEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRestaurantsEvent extends RestaurantEvent {}

class GetFeaturedRestaurantsEvent extends RestaurantEvent {}

class GetRestaurantsByCategoryEvent extends RestaurantEvent {
  final int categoryId;
  GetRestaurantsByCategoryEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}
