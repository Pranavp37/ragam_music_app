import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:ragam/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';
import 'package:ragam/domain/entities/song/song.dart';

class FavorateBotton extends StatelessWidget {
  final SongEntities songEntities;
  const FavorateBotton({super.key, required this.songEntities});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoriteButtonCubit>()
                      .favorateBottonUpdated(songEntities.songId);
                },
                icon: Icon(
                  songEntities.isFavorate
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                ));
          }
          if (state is FavoriteBUttonUpdated) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoriteButtonCubit>()
                      .favorateBottonUpdated(songEntities.songId);
                },
                icon: Icon(
                  state.isFavorate
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                ));
          }

          return Container();
        },
      ),
    );
  }
}
