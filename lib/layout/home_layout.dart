import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/cubit/bottom_navbar_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, AppStates>(
        listener: (context, state) {}, builder: (context, state) {
          BottomNavBarCubit bottomNavBarCubit=BottomNavBarCubit.get(context);
      return Scaffold(
        body: bottomNavBarCubit.screens[bottomNavBarCubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavBarCubit.navbarItems,
          onTap:(index)=>setState(() {
            bottomNavBarCubit.changeNavBar(index);
          }),
          currentIndex:bottomNavBarCubit.currentIndex,
        ),
      );
    });
  }
}
