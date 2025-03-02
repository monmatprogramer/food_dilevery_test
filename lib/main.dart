import 'package:di_tutorail_app/injection_container.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_bloc.dart';
import 'package:di_tutorail_app/presentation/bloc/restaurant_event.dart';
import 'package:di_tutorail_app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DI Tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            sl<RestaurantBloc>()..add(GetRestaurantsEvent()),
        child: HomePage(),
      ),
    );
  }
}
