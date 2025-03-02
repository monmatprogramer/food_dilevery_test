import 'package:di_tutorail_app/injection_container.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_bloc.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_event.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RestaurantBloc>()
        ..add(
          GetRestaurantsEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Restaurants"),
        ),
        body: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantInitial) {
              return Center(
                child: Text("Press a button to load restaurants"),
              );
            } else if (state is RestaurantLoaded) {
              return ListView.builder(
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = state.restaurants[index];
                  return ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text("Rating: ${restaurant.rating}"),
                  );
                },
              );
            } else if (state is RestaurantError) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 160,
              right: 0,
              child: FloatingActionButton(
                heroTag: "all",
                onPressed: () {
                  context.read<RestaurantBloc>().add(GetRestaurantsEvent());
                },
                child: const Text("All"),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 0,
              child: FloatingActionButton(
                heroTag: "Featured",
                onPressed: () {},
                child: const Text("F"),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                heroTag: "C1",
                onPressed: () {},
                child: const Text("C1"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
