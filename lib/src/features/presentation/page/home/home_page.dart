// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/core/routes/names_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: SvgPicture.asset(
          "assets/ic_instagram.svg",
          color: primaryColor,
          height: 32,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.chat, color: primaryColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      sizeHor(10),
                      const Text(
                        "Username",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      _openBottomModalSheet(context);
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: primaryColor,
                    ))
              ],
            ),
            sizeVer(10),
            GestureDetector(
              onDoubleTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Container(
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            sizeVer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: primaryColor,
                    ),
                    sizeHor(10),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PageConst.commentPage);
                        },
                        child: const Icon(
                          Icons.message,
                          color: primaryColor,
                        )),
                    sizeHor(10),
                    const Icon(
                      Icons.send,
                      color: primaryColor,
                    ),
                  ],
                ),
                const Icon(
                  Icons.bookmark_border,
                  color: primaryColor,
                )
              ],
            ),
            sizeVer(10),
            const Text(
              "0 likes",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            sizeVer(10),
            Row(
              children: [
                const Text(
                  "Username",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                sizeHor(10),
                const Text(
                  "Description",
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
            sizeVer(10),
            GestureDetector(
                onTap: () {},
                child: const Text(
                  "View all comments",
                  style: TextStyle(color: darkGreyColor),
                )),
            sizeVer(10),
            const Text(
              "10/02/2012",
              style: TextStyle(color: darkGreyColor),
            ),
          ],
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
                              context, PageConst.updatePostPage);
                        },
                        child: const Text(
                          "Update Post",
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
                        onTap: () {},
                        child: const Text(
                          "Delete Post",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
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
}
