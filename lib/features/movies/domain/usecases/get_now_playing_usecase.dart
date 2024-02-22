import 'package:dartz/dartz.dart';

import '../../../../shared_libraries/utils/error/failure_response.dart';
import '../../../../shared_libraries/utils/usecase/usecase.dart';
import '../entities/response/movie_response_entity.dart';
import '../repositories/movies_repository.dart';

class GetNowPlayingUseCase extends UseCase<List<MovieDataEntity>, NoParams> {
  final MoviesRepository moviesRepository;

  GetNowPlayingUseCase({required this.moviesRepository});
  @override
  Future<Either<FailureResponse, List<MovieDataEntity>>> call(
          NoParams params) async =>
      moviesRepository.getNowPlaying();
}
