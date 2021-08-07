import 'package:counter/presentation/screens/second_screen.dart';
import 'package:counter/presentation/screens/third_sreen.dart';
import 'package:flutter/material.dart';
import 'package:counter/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter/logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(
                title: 'HomeScreen',
                color: Colors.blue,
              ),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                title: 'SecondScreen',
                color: Colors.red,
              ),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(
                title: 'ThirdScreen',
                color: Colors.green,
              ),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
