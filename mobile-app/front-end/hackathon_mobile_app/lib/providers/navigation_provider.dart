import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<NavigationProvider, int> navigationProvider =
    StateNotifierProvider<NavigationProvider, int>(
  (ref) => NavigationProvider(),
);

class NavigationProvider extends StateNotifier<int> {
  NavigationProvider() : super(0);

  void navigateToPage(int pageNumber) {
    state = pageNumber;
  }
}
