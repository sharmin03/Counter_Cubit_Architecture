import 'package:counter/logic/cubit/counter_cubit.dart';
import 'package:counter/presentation/screens/home_screen.dart';
import 'package:counter/presentation/screens/third_sreen.dart';
import 'package:counter/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: 'HomeScreen',
              color: Colors.blue,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(
              title: 'SecondScreen',
              color: Colors.red,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(
              title: 'ThirdScreen',
              color: Colors.green,
            ),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
