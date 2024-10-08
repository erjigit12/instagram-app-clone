import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/core/routes/names_route.dart';
import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/auth/auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  final UserEntity currentUser;
  const ProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          '${currentUser.username}',
          style: const TextStyle(color: primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                _openBottomModalSheet(context);
              },
              icon: const Icon(Icons.menu, color: primaryColor),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "${currentUser.totalPosts}",
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sizeVer(8),
                          const Text(
                            "Posts",
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                      sizeHor(25),
                      Column(
                        children: [
                          Text(
                            "${currentUser.totalFollowers}",
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sizeVer(8),
                          const Text(
                            "Followers",
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                      sizeHor(25),
                      Column(
                        children: [
                          Text(
                            "${currentUser.totalFollowing}",
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sizeVer(8),
                          const Text(
                            "Following",
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              sizeVer(10),
              Text(
                currentUser.name == "" ? "" : "",
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizeVer(10),
              Text(
                "${currentUser.bio}",
                style: const TextStyle(color: primaryColor),
              ),
              sizeVer(10),
              GridView.builder(
                itemCount: 5,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: secondaryColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            decoration: BoxDecoration(color: backgroundColor.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageConst.editProfilePage);
                        },
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    sizeVer(7),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    sizeVer(7),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () {
                          _signOut(context);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    sizeVer(7),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).loggedOut();
    Navigator.pushNamedAndRemoveUntil(
        context, PageConst.signInPage, (route) => false);
  }
}
