import 'package:flutter/material.dart';
import 'package:social_app/module/login_screen.dart';
import 'package:social_app/module/signup_screen.dart';
import 'package:social_app/shared/component/constants.dart';
import 'package:social_app/shared/style/colors.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          defaultBackground(
              context: context,
              imagePath:
                  "https://img.freepik.com/premium-photo/portrait-young-woman-using-mobile-phone_1048944-30344856.jpg?w=900"),

          /// Column
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Title and Description
                Text("Find new friends nearby",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 55)),
                const SizedBox(height: 25),
                Text(
                  "With milions of users all over the world, we gives you the ability to connect with people no matter where you are.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),

                /// Buttons
                defaultButtonWhite(
                    context: context,
                    buttonText: "Login",
                    onPressed: () => navigate(
                        context: context, requiredScreen: const LoginScreen())),
                const SizedBox(height: 10),
                defaultButtonGradient(
                    context: context,
                    buttonText: "Sign Up",
                    onPressed: () => navigate(
                        context: context,
                        requiredScreen: SignupScreen())),
                const SizedBox(height: 40),

                /// Login Options
                Text(
                  "Or log in with",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(IconBroken.Activity),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(IconBroken.User1), onPressed: () {}),
                    IconButton(
                        icon: const Icon(IconBroken.Send), onPressed: () {}),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
