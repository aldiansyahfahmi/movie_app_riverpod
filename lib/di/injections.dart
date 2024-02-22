import 'package:get_it/get_it.dart';
import 'package:movie_app_riverpod/features/movies/di/movies_dependency.dart';
import 'package:movie_app_riverpod/shared_libraries/core/di/core_module.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> initialize() async {
    await _registerSharedLibraries();
    _registerFeatures();
  }

  Future<void> _registerSharedLibraries() async {
    await RegisterCoreModule().core();
  }

  void _registerFeatures() {
    MoviesDependency();
  }
}
