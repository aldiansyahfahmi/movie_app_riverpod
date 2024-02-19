import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(ThemeData.dark());

  void changeTheme() {
    if (state == ThemeData.light()) {
      state = ThemeData.dark();
    } else {
      state = ThemeData.light();
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});
