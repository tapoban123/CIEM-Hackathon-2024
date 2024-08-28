import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<ShowOrHideBNBNotifier, bool> showOrHideBNBProvider =
    StateNotifierProvider<ShowOrHideBNBNotifier, bool>(
  (ref) => ShowOrHideBNBNotifier(),
);

class ShowOrHideBNBNotifier extends StateNotifier<bool> {
  ShowOrHideBNBNotifier() : super(true);

  void showBNB() {
    state = true;
  }

  void hideBNB() {
    state = false;
  }
}
