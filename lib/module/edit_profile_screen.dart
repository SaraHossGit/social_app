import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/cubit/login_cubit.dart';
import 'package:social_app/module/profile_screen.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/component/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<dynamic> photosList = [
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  editProfileCoverImage(
                      context: context,
                      coverImg: loginCubit.userModel?.coverPic ?? "",
                      profileImg: loginCubit.userModel?.profilePic ?? "",
                      username: loginCubit.userModel?.username ?? ""),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About me",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 10),

                        TextFormField(
                          initialValue: loginCubit.userModel?.bio ??
                              "Write your Bio here...",
                          maxLines: 10,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 15),

                        Text("Photos",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 10),

                        photosListBuilder(photosList: photosList, edit: true),
                        const SizedBox(height: 20),

                        defaultButtonGradient(
                            context: context,
                            buttonText: "Update",
                            onPressed: () => navigateAndEnd(
                                context: context,
                                requiredScreen: const ProfileScreen()))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
