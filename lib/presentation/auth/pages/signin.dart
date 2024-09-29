import 'package:flutter/material.dart';
import 'package:ragam/core/configs/assets/app_image.dart';
import 'package:ragam/common/widgets/appbar/app_bar.dart';
import 'package:ragam/common/widgets/botton/basic_app_button.dart';
import 'package:ragam/data/models/auth/signin_user_request.dart';
import 'package:ragam/domain/usecases/auth/signin.dart';
import 'package:ragam/presentation/auth/pages/signup.dart';
import 'package:ragam/presentation/home/pages/home.dart';
import 'package:ragam/service_locator.dart';

class Signinpage extends StatelessWidget {
  Signinpage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        titile: Image.asset(
          AppImage.logo,
          height: 85,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _loginText(),
              const SizedBox(height: 40),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicAppButton(
                  onPressed: () async {
                    var result = await s1<SigninUsecase>().call(
                        params: SigninUserRequest(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ));
                    result.fold(
                      (l) {
                        var snackbar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      (r) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  },
                  title: 'Sign In'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: 'Enter Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ));
              },
              child: const Text('Register Now'))
        ],
      ),
    );
  }
}
