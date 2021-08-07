import 'package:bloc_test/bloc_test.dart';
import 'package:counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() {});

    tearDown(() {
      counterCubit.close();
    });

    blocTest<CounterCubit, CounterState>(
      'The cubit should emit CounterState(counterValue:1, wasIncremented: true) when cubit.increment() is called',
      build: () => CounterCubit(),
      act: (counterCubit) => counterCubit.increment(),
      expect: () => [
        CounterState(counterValue: 1, wasIncremented: true),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'The cubit should emit CounterState(counterValue:-1, wasIncremented: false) when cubit.decrement() is called',
      build: () => CounterCubit(),
      act: (counterCubit) => counterCubit.decrement(),
      expect: () => [
        CounterState(counterValue: -1, wasIncremented: false),
      ],
    );
  });
}
