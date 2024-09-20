import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ragam/assets/app_image.dart';
import 'package:ragam/assets/app_vectors.dart';
import 'package:ragam/common/widgets/botton/basic_app_button.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';
import 'package:ragam/presentation/auth/pages/signup_or_signin.dart';
import 'package:ragam/presentation/choosemode/bloc/theme_cubit.dart';

class ChooseModepage extends StatelessWidget {
  const ChooseModepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImage.choodemode),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.300),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 120,
                    child: Image.asset(AppImage.logo),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393c)
                                        .withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Dark mode',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393c)
                                        .withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Light mode',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupOrSignin(),
                        ),
                      );
                    },
                    title: 'Continue'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
