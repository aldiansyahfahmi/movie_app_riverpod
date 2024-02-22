import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/features/movies/presentation/provider/now_playing_provider/now_playing_provider.dart';
import 'package:movie_app_riverpod/shared_libraries/component/loading/shimmer_loading.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/state/view_data_state.dart';
import 'package:movie_app_riverpod/shared_libraries/utils/style/typography.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(nowPlayingNotifierProvider.notifier).getNowPlaying();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer(
              builder: (context, widRef, child) {
                final movies = widRef.watch(nowPlayingNotifierProvider).state;
                return movies.when(
                  (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Now Playing',
                        style: MyTypography.label1.semiBold,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            final movie = data[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    height: 210,
                                    width: 140,
                                    fit: BoxFit.cover,
                                    imageUrl: movie.posterPath,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.red,
                                            BlendMode.colorBurn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        ShimmerLoading(
                                      child: Container(
                                        height: 160,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.image,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  movie.title,
                                  style: MyTypography.label2.bold,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 8),
                                RatingBarIndicator(
                                  rating: (movie.voteAverage / 10.0) * 5.0,
                                  itemBuilder: (context, index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                  itemCount: 5,
                                  itemSize: 14.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 16);
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
