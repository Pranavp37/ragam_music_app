import 'package:flutter/material.dart';
import 'package:ragam/assets/app_image.dart';
import 'package:ragam/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    goto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 140,
          child: Image.asset(AppImage.logo),
        ),
      ),
    );
  }

  Future<void> goto() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GetStartedPage(),
        ));
  }
}
