import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/app/main_app.dart';
import 'package:movie_app_riverpod/di/injections.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/setup/app_setup.dart';

void main() async {
  Config.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
  runApp(const ProviderScope(child: MyApp()));
}
