import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider authProvider = StateNotifierProvider(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);
  
}
