import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/di/injections.dart';
import 'package:movie_app_riverpod/features/movies/domain/usecases/get_up_coming_usecase.dart';
import 'package:movie_app_riverpod/features/movies/presentation/provider/up_coming_provider/up_coming_state.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/usecase/usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'up_coming_provider.g.dart';

@riverpod
class UpComingNotifier extends _$UpComingNotifier {
  @override
  UpComingState build() => UpComingState(state: ViewData.initial());

  void getUpComing() async {
    GetUpComingUseCase getUpComingUseCase = sl();
    state = UpComingState(state: ViewData.loading());
    final result = await getUpComingUseCase.call(const NoParams());
    result.fold(
      (failure) => state = UpComingState(
        state: ViewData.error(
          message: failure.errorMessage,
          failure: failure,
        ),
      ),
      (result) {
        if (result.isEmpty) {
          state = UpComingState(
            state: ViewData.noData(
              message: 'No Data',
            ),
          );
        } else {
          state = UpComingState(
            state: ViewData.loaded(
              data: result.take(10).toList(),
            ),
          );
        }
      },
    );
  }
}

final sliderIndexProvider = StateProvider<int>((ref) => 0);
