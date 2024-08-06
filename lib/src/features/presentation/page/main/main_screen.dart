// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/user/get_single_user/get_single_user_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/page/activity/activity_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/home/home_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/post/upload_post_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/profile/profile_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/search/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.uid});

  final String uid;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      builder: (context, getSingleUserState) {
        if (getSingleUserState is GetSingleUserSuccess) {
          final currentUser = getSingleUserState.user;

          return Scaffold(
            backgroundColor: backgroundColor,
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: backgroundColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: primaryColor),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: primaryColor),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle, color: primaryColor),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: primaryColor),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon:
                      Icon(Icons.account_circle_outlined, color: primaryColor),
                  label: "",
                ),
              ],
              onTap: navigationTapped,
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                const HomePage(),
                const SearchPage(),
                const UploadPostPage(),
                const ActivityPage(),
                ProfilePage(currentUser: currentUser),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
