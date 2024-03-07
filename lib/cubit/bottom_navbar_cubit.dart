import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/module/chats_screen.dart';
import 'package:social_app/module/feeds_screen.dart';
import 'package:social_app/module/post_screen.dart';
import 'package:social_app/module/profile_screen.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class BottomNavBarCubit extends Cubit<AppStates> {
  BottomNavBarCubit() : super(InitState());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    const PostScreen(),
    const ChatsScreen(),
    const ProfileScreen(),
  ];
  List<BottomNavigationBarItem> navbarItems = [
    const BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: "Feeds"),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.Paper_Upload), label: "Post"),
    const BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: "Chats"),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.Profile), label: "Profile"),
  ];

  void changeNavBar(index) {
    currentIndex = index;
    emit(BottomNavBarChanged());
  }
}
