import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/features/main/presentation/provider/theme_provider/theme_provider.dart';
import 'package:movie_app_riverpod/features/main/presentation/screen/main_screen.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/setup/app_setup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return MaterialApp(
          title: Config.appName,
          debugShowCheckedModeBanner: Config.isDebug,
          theme: ref.watch(themeProvider),
          home: const MainScreen(),
        );
      },
    );
  }
}
