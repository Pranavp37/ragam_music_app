import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/common/helpers/is_dark_mode.dart';
import 'package:ragam/common/widgets/appbar/app_bar.dart';
import 'package:ragam/common/widgets/favorate_botton/favorate_botton.dart';
import 'package:ragam/core/configs/constant/app_urls.dart';
import 'package:ragam/presentation/profile/bloc/favt_songs_cubit.dart';
import 'package:ragam/presentation/profile/bloc/favt_songs_state.dart';
import 'package:ragam/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:ragam/presentation/profile/bloc/profile_info_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        backgrdcolor:
            context.isDarkmode ? const Color(0xff2C2B2B) : Colors.white,
        titile: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          _favoratesongs(),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          color: context.isDarkmode ? const Color(0xff2C2B2B) : Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
            builder: (context, state) {
          if (state is ProfileInfoLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          if (state is ProfileInfoLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            state.userEntity.imageUrl ?? AppURLs.defaultUrl),
                      ),
                      shape: BoxShape.circle),
                ),
                const SizedBox(height: 20),
                Text(
                  state.userEntity.email!,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  state.userEntity.fullName!,
                  style: TextStyle(
                    fontSize: 25,
                    color: context.isDarkmode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }

          if (state is ProfileInfoFailed) {
            return const Text(" Please try again");
          }
          return Container();
        }),
      ),
    );
  }

  Widget _favoratesongs() {
    return BlocProvider(
      create: (context) => FavtSongsCubit()..getFavoriteSongd(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'FAVORATE SONGS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<FavtSongsCubit, FavtSongsState>(
              builder: (context, state) {
                if (state is FavtSongsLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is FavtSongsLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${AppURLs.coverFirestorage}${state.favorateSongd[index].artist}-${state.favorateSongd[index].titile}.jpg?${AppURLs.mediaAlt}'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.favorateSongd[index].titile,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    state.favorateSongd[index].artist,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                state.favorateSongd[index].duration
                                    .toString()
                                    .replaceAll('.', ':'),
                              ),
                              const SizedBox(width: 20),
                              FavorateBotton(
                                songEntities: state.favorateSongd[index],
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: state.favorateSongd.length,
                  );
                }
                if (state is FavtSongsFailed) {
                  return const Text('Please try again');
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
