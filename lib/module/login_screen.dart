import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/cubit/login_cubit.dart';
import 'package:social_app/module/forget_pass_screen.dart';
import 'package:social_app/shared/component/constants.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/style/icon_broken.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
var loginFormKey = GlobalKey<FormState>();
var isPasswordObscure = true;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                defaultBackground(
                    context: context,
                    icon: IconBroken.Arrow___Left,
                    onIconPressed: () => Navigator.pop(context),
                    imagePath:
                        "https://img.freepik.com/free-photo/mobile-notification-icons-man-woman-using-cell-phone_23-2147844554.jpg?size=626&ext=jpg&ga=GA1.1.1422658711.1709631626&semt=ais"),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title and Description
                      Text("Welcome Back",
                          style: Theme.of(context).textTheme.displayMedium),
                      const SizedBox(height: 10),
                      Text(
                        "Login to your account",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 50),

                      /// Textfields
                      defaultTextFormField(
                          labelText: "Email",
                          controller: emailController,
                          validator: (value) {}),

                      const SizedBox(height: 8),

                      defaultTextFormField(
                          labelText: "Password",
                          controller: passController,
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
                          buttonText: "Login",
                          onPressed: () {
                            loginCubit.loginFirebase(
                                context: context,
                                email: emailController.text,
                                password: passController.text);
                          }),

                      /// Forgot Pass Button
                      const SizedBox(height: 50),
                      defaultTextButton(
                          context: context,
                          buttonText: "Forgot your password?",
                          onPressed: () => navigate(
                              context: context,
                              requiredScreen: ForgetPasswordScreen()))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
