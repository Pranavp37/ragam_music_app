import 'package:flutter/material.dart';
import 'package:ragam/core/configs/assets/app_image.dart';
import 'package:ragam/common/widgets/botton/basic_app_button.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';
import 'package:ragam/presentation/choosemode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                image: AssetImage(AppImage.getStarted),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              left: 20,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 90,
                    child: Image.asset(AppImage.logo),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 40,
                    top: 5,
                    bottom: 40,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Enjoy Listening To Music',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      const Text(
                        'Lorem ipsum dolor sitnamet.consectetur adipiscing elit. Sagittis enim Purus sed phasellus Cursus ornare id scelerisque aliquam',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChooseModepage(),
                              ),
                            );
                          },
                          title: 'Get Started'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
