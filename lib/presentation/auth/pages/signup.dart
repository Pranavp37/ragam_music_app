import 'package:flutter/material.dart';
import 'package:ragam/assets/app_image.dart';
import 'package:ragam/common/widgets/appbar/app_bar.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        titile: Image.asset(AppImage.logo),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
