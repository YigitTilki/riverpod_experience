import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experience/counter_manager.dart';
import 'package:riverpod_experience/model/counter_model.dart';

final titleProvider = Provider<String>((ref) => "RiverPod Basics");
final titleProvider2 = Provider<String>((ref) => "RiverPod Notifier Usage");

final textProvider = Provider<String>((ref) => "Butona basılma sayısı");

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});
final counterNotifierProvider =
    StateNotifierProvider<CounterManager, CounterModel>((ref) {
  return CounterManager();
});
final evenNumberProvider = Provider<bool>((ref) {
  var counterModel = ref.watch(counterNotifierProvider);
  return counterModel.counterValue % 2 == 0;
});
