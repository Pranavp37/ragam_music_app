import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/common/widgets/appbar/app_bar.dart';
import 'package:ragam/common/widgets/favorate_botton/favorate_botton.dart';
import 'package:ragam/core/configs/constant/app_urls.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';
import 'package:ragam/domain/entities/song/song.dart';
import 'package:ragam/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:ragam/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  const SongPlayerPage({
    super.key,
    required this.songEntities,
  });
  final SongEntities songEntities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titile: const Text(
          'Now Playing...',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        action: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            )),
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadSong(
              '${AppURLs.songFirestorage}${songEntities.artist}-${songEntities.titile}.mp3?${AppURLs.mediaAlt}'),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(
                height: 20,
              ),
              _songDetails(),
              const SizedBox(
                height: 30,
              ),
              _songPlayer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              '${AppURLs.coverFirestorage}${songEntities.artist}-${songEntities.titile}.jpg?${AppURLs.mediaAlt}'),
        ),
      ),
    );
  }

  Widget _songDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntities.titile,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              songEntities.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
        FavorateBotton(
          songEntities: songEntities,
        ),
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(
                      context.read<SongPlayerCubit>().songPosition)),
                  Text(formatDuration(
                      context.read<SongPlayerCubit>().songDuration)),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 25,
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<SongPlayerCubit>().playOrPuseSong();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          context.read<SongPlayerCubit>().audioPlayer.playing
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 25,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20)
            ],
          );
        }
        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
