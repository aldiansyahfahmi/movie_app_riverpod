import 'package:equatable/equatable.dart';
import 'package:movie_app_riverpod/features/movies/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/state/view_data_state.dart';

class NowPlayingState extends Equatable {
  final ViewData<List<MovieDataEntity>> state;

  const NowPlayingState({required this.state});

  @override
  List<Object?> get props => [state];
}
