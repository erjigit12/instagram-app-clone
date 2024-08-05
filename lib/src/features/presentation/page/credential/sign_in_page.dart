// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/core/routes/names_route.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/form_container_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
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
            sizeVer(30),
            const FormContainerWidget(hintText: 'Email'),
            sizeVer(15),
            const FormContainerWidget(
              hintText: 'Password',
              isPasswordField: true,
            ),
            sizeVer(15),
            ButtonContainerWidget(
              text: 'Sign In',
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
                  "Don't have an account? ",
                  style: TextStyle(color: secondaryColor),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, PageConst.signUpPage, (route) => false);
                  },
                  child: const Text(
                    'Sign up',
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
