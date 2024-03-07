import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/component/constants.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          defaultBackground(
              context: context,
              icon: IconBroken.Arrow___Left,
              onIconPressed: () => Navigator.pop(context),
              imagePath:
                  "https://img.freepik.com/free-photo/male-model-surrounded-by-hands-like-his-own-thoughts-dark-background_155003-32220.jpg?t=st=1709639957~exp=1709643557~hmac=b15bb2ec68d59672cedd86e4bb58256a609548e98fa4105bca4d3c6dfa48162f&w=360"),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title and Description
                Text("Forgot Password",
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 10),
                Text(
                  "Please enter your email address. You will receive a link to create a new password via email.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 50),

                /// Textfields
                defaultTextFormField(
                    context: context,
                    labelText: "Your email",
                    controller: emailController,
                    validator: (value) {}),

                const SizedBox(height: 30),

                /// Login Button
                defaultButtonGradient(
                    context: context, buttonText: "Send", onPressed: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailController.text).then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Check your Email'),
                  )));
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
