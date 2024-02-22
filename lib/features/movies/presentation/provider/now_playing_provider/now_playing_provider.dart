// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app_riverpod/di/injections.dart';
import 'package:movie_app_riverpod/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie_app_riverpod/features/movies/presentation/provider/now_playing_provider/now_playing_state.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/usecase/usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'now_playing_provider.g.dart';

@riverpod
class NowPlayingNotifier extends _$NowPlayingNotifier {
  @override
  NowPlayingState build() => NowPlayingState(state: ViewData.initial());

  void getNowPlaying() async {
    GetNowPlayingUseCase getNowPlayingUseCase = sl();
    state = NowPlayingState(state: ViewData.loading());
    final result = await getNowPlayingUseCase.call(const NoParams());
    result.fold(
      (failure) => state = NowPlayingState(
        state: ViewData.error(
          message: failure.errorMessage,
          failure: failure,
        ),
      ),
      (result) {
        if (result.isEmpty) {
          state = NowPlayingState(
            state: ViewData.noData(
              message: 'No Data',
            ),
          );
        } else {
          state = NowPlayingState(
            state: ViewData.loaded(
              data: result,
            ),
          );
        }
      },
    );
  }
}
