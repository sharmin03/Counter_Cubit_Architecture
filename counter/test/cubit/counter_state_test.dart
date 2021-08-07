import 'package:counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() {});

    tearDown(() {});

    test('initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });
  });
}
