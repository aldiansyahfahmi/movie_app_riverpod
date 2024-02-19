import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/features/main/presentation/provider/theme_provider/theme_provider.dart';
import 'package:movie_app_riverpod/features/main/presentation/screen/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return MaterialApp(
          title: 'Movie App Riverpod',
          theme: ref.watch(themeProvider),
          home: const MainScreen(),
        );
      },
    );
  }
}
