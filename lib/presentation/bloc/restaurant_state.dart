import 'package:di_tutorail_app/domain/entities/restaurant.dart';
import 'package:equatable/equatable.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<Restaurant> restaurants;
  RestaurantLoaded(this.restaurants);
  @override
  List<Object?> get props => [restaurants];
}

class RestaurantError extends RestaurantState {
  final String message;
  RestaurantError({required this.message});

  @override
  List<Object?> get props => [message];
}
