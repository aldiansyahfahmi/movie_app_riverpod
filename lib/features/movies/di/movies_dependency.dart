import 'package:movie_app_riverpod/di/injections.dart';
import 'package:movie_app_riverpod/features/movies/data/datasources/remote/movies_remote_datasource.dart';
import 'package:movie_app_riverpod/features/movies/data/mapper/movies_mapper.dart';
import 'package:movie_app_riverpod/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_app_riverpod/features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app_riverpod/features/movies/domain/usecases/get_now_playing_usecase.dart';

class MoviesDependency {
  MoviesDependency() {
    _registerDataSource();
    _registerMapper();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSource() {
    sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(
        dio: sl(),
      ),
    );
  }

  void _registerMapper() {
    sl.registerLazySingleton<MoviesMapper>(() => MoviesMapper());
  }

  void _registerRepository() {
    sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(
        moviesMapper: sl(),
        moviesRemoteDataSource: sl(),
      ),
    );
  }

  void _registerUseCases() {
    sl.registerLazySingleton<GetNowPlayingUseCase>(
      () => GetNowPlayingUseCase(
        moviesRepository: sl(),
      ),
    );
  }
}
