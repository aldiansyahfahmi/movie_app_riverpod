import 'package:dartz/dartz.dart';

import '../../../../shared_libraries/utils/error/failure_response.dart';
import '../entities/response/movie_response_entity.dart';

abstract class MoviesRepository {
  Future<Either<FailureResponse, List<MovieDataEntity>>> getNowPlaying();
}
