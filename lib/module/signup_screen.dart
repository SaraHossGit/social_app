import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/cubit/register_cubit.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/component/constants.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                defaultBackground(
                    context: context,
                    icon: IconBroken.Arrow___Left,
                    onIconPressed: () => Navigator.pop(context),
                    imagePath:
                        "https://img.freepik.com/free-photo/social-media-marketing-concept-marketing-with-applications_23-2150063146.jpg?w=360&t=st=1709641069~exp=1709641669~hmac=572dbbdf06df686298c195cf659dce3b08be58cf33d944aa18fd8fa48920bd03"),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title and Description
                      Text("Create an account",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 42)),
                      const SizedBox(height: 50),

                      /// Textfields
                      defaultTextFormField(
                          labelText: "Username",
                          controller: usernameController,
                          validator: (value) {}),

                      const SizedBox(height: 8),

                      defaultTextFormField(
                          labelText: "Email",
                          controller: emailController,
                          validator: (value) {}),

                      const SizedBox(height: 8),

                      defaultTextFormField(
                          labelText: "Phone",
                          controller: phoneController,
                          validator: (value) {}),

                      const SizedBox(height: 8),

                      defaultTextFormField(
                          labelText: "Date of Birth",
                          controller: dateOfBirthController,
                          validator: (value) {}),

                      const SizedBox(height: 8),

                      defaultTextFormField(
                          labelText: "Password",
                          controller: passwordController,
                          isPassword: true,
                          isPasswordObscure: isPasswordObscure,
                          onSuffixPressed: () => setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              }),
                          validator: (value) {}),

                      const SizedBox(height: 30),

                      /// Login Button
                      defaultButtonGradient(
                          context: context,
                          buttonText: "Sign Up",
                          onPressed: () {
                            registerCubit.registerUserFirebase(
                              context: context,
                              username: usernameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              dateOfBirth: dateOfBirthController.text,
                              password: passwordController.text,
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
