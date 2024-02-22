import 'package:dio/dio.dart';

import '../../../../../shared_libraries/core/network/models/api_response.dart';
import '../../../../../shared_libraries/utils/constants/app_constants.dart';
import '../../models/response/movie_response_dto.dart';

abstract class MoviesRemoteDataSource {
  Future<ApiResponse<List<MovieDataDto>>> getNowPlaying();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio dio;

  MoviesRemoteDataSourceImpl({required this.dio});

  @override
  Future<ApiResponse<List<MovieDataDto>>> getNowPlaying() async {
    try {
      final response = await dio.get(AppConstants.appApi.upcomingMovie);
      return ApiResponse.fromJson(
        response.data,
        onDataDeserialized: (json) => List<MovieDataDto>.from(
          json.map(
            (x) => MovieDataDto.fromJson(x),
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
