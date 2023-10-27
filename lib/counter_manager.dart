import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experience/model/counter_model.dart';

class CounterManager extends StateNotifier<CounterModel> {
  CounterManager() : super(CounterModel(counterValue: 0));

  void increase() {
    var currentCounterValue = state.counterValue;
    state = CounterModel(counterValue: currentCounterValue + 1);
  }

  void decrease() {
    var currentCounterValue = state.counterValue;
    state = CounterModel(counterValue: currentCounterValue - 1);
  }
}
