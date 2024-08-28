import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<bool> readOnlyCommunityTextfieldProvider = StateProvider<bool>(
  (ref) => true,
);

Provider<FocusNode> communityTextFieldFocusNodeProvider = Provider(
  (ref) => FocusNode(),
);
