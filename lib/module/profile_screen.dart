import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/cubit/login_cubit.dart';
import 'package:social_app/module/edit_profile_screen.dart';
import 'package:social_app/shared/component/components.dart';
import 'package:social_app/shared/component/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<dynamic> photosList = [
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900",
    "https://img.freepik.com/free-photo/hesitant-puzzled-unshaven-man-shruggs-shoulders-bewilderment-feels-indecisive-has-bristle-trendy-haircut-dressed-blue-stylish-shirt-isolated-white-wall-clueless-male-poses-indoor_273609-16518.jpg?t=st=1709720663~exp=1709724263~hmac=0cbb319d6bbec22213aedc29e36ca43298275e6d51028bdb139d43a98034db9d&w=900"
  ];

  List<dynamic> friendsList = [
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

        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileCoverImage(
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

                      /// Profile Header
                      Row(
                        children: [
                          statContainer(
                              context: context, title: "Posts", stat: 128),
                          const SizedBox(width: 10),
                          statContainer(
                              context: context,
                              title: "Following",
                              stat: 1234),
                          const SizedBox(width: 10),
                          statContainer(
                              context: context,
                              title: "Follower",
                              stat: 4567),
                          const SizedBox(width: 30),
                          Expanded(
                              child: defaultButtonGradient(
                                  context: context,
                                  buttonText: "Edit Profile",
                                  onPressed: ()=>navigate(context: context, requiredScreen: const EditProfileScreen())))
                        ],
                      ),
                      const SizedBox(height: 15),

                      Text("About me",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),

                      Text(
                          loginCubit.userModel?.bio ??
                              "Write your Bio here...",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 15),

                      Text("Photos",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),

                      photosListBuilder(photosList: photosList),
                      const SizedBox(height: 15),

                      Text("Friends",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),

                      friendsListBuilder(friendsList: friendsList),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
