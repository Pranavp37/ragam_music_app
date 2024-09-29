import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/common/widgets/appbar/app_bar.dart';
import 'package:ragam/core/configs/constant/app_urls.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';
import 'package:ragam/domain/entities/song/song.dart';
import 'package:ragam/presentation/home/bloc/play_list_cubit.dart';
import 'package:ragam/presentation/song_player/bloc/song_player_cubit.dart';

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
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline_outlined,
              size: 35,
              color: AppColors.darkGrey,
            ))
      ],
    );
  }
}
