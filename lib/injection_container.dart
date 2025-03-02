import 'package:di_tutorail_app/data/repositories/restaurant_repository_imp.dart';
import 'package:di_tutorail_app/domain/repositories/restaurant_repository.dart';
import 'package:di_tutorail_app/domain/usecases/get_featured_restaurants.dart';
import 'package:di_tutorail_app/domain/usecases/get_restaurants.dart';
import 'package:di_tutorail_app/domain/usecases/get_restaurants_by_category.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // Bloc
  sl.registerFactory(() => RestaurantBloc(
        getRestaurants: sl(),
        getFeaturedRestaurants: sl(),
        getRestaurantsByCategory: sl(),
      ));

  // Use case
  sl.registerLazySingleton(() => GetRestaurants(sl()));
  sl.registerLazySingleton(() => GetFeaturedRestaurants(sl()));
  sl.registerLazySingleton(() => GetRestaurantsByCategory(sl()));

  // Repository
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImp(),
  );
}
