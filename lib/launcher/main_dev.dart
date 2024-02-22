import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/app/main_app.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/setup/app_setup.dart';

void main() {
  Config.appFlavor = Flavor.dev;
  runApp(const ProviderScope(child: MyApp()));
}
