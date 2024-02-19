import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationProvider extends StateNotifier<int> {
  BottomNavigationProvider() : super(0);

  void changeTab(int index) {
    state = index;
  }
}

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationProvider, int>((ref) {
  return BottomNavigationProvider();
});
