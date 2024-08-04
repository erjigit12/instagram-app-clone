// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/features/presentation/page/credential/sign_in_page.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/form_container_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
              ),
            ),
            sizeVer(15),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: secondaryColor,
                    ),
                    child: Image.asset("assets/profile_default.png"),
                  ),
                  Positioned(
                    right: -10,
                    bottom: -15,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo, color: blueColor),
                    ),
                  ),
                ],
              ),
            ),
            sizeVer(30),
            const FormContainerWidget(hintText: 'User Name'),
            sizeVer(15),
            const FormContainerWidget(hintText: 'Email'),
            sizeVer(15),
            const FormContainerWidget(
              hintText: 'Password',
              isPasswordField: true,
            ),
            sizeVer(15),
            const FormContainerWidget(hintText: 'Bio'),
            sizeVer(15),
            ButtonContainerWidget(
              text: 'Sign Up',
              color: blueColor,
              onTapListener: () {},
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const Divider(color: secondaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: secondaryColor),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
