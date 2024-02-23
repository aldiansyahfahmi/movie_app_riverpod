import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../shared_libraries/utils/error/failure_response.dart';
import '../../domain/entities/response/movie_response_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/remote/movies_remote_datasource.dart';
import '../mapper/movies_mapper.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final MoviesMapper moviesMapper;

  MoviesRepositoryImpl({
    required this.moviesRemoteDataSource,
    required this.moviesMapper,
  });

  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>> getNowPlaying() async {
    try {
      final response = await moviesRemoteDataSource.getNowPlaying();
      return Right(
          moviesMapper.mapListMoviesDataDtoToEntity(response.results!));
    } on DioException catch (error) {
      return Left(FailureResponse.dio(error));
    }
  }

  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>> getUpComing() async {
    try {
      final response = await moviesRemoteDataSource.getUpComing();
      return Right(
          moviesMapper.mapListMoviesDataDtoToEntity(response.results!));
    } on DioException catch (error) {
      return Left(FailureResponse.dio(error));
    }
  }
}
