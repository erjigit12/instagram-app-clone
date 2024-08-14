// ignore_for_file: deprecated_member_use, invalid_use_of_visible_for_testing_member

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_app_clone/profile_widget.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/core/routes/names_route.dart';
import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/auth/auth_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/credential/credential_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/page/main/main_screen.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();

  bool _isSigningUp = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  File? _image;

  Future selectImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          log("no image has been selected");
        }
      });
    } catch (e) {
      toast("some error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            toast("Invalid email or password");
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid);
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
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
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: profileWidget(image: _image)),
                ),
                Positioned(
                  right: -10,
                  bottom: -15,
                  child: IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: const Icon(Icons.add_a_photo, color: blueColor),
                  ),
                ),
              ],
            ),
          ),
          sizeVer(30),
          FormContainerWidget(
            hintText: 'User Name',
            controller: _userNameController,
          ),
          sizeVer(15),
          FormContainerWidget(
            hintText: 'Email',
            controller: _emailController,
          ),
          sizeVer(15),
          FormContainerWidget(
            hintText: 'Password',
            controller: _passwordController,
            isPasswordField: true,
          ),
          sizeVer(15),
          FormContainerWidget(
            hintText: 'Bio',
            controller: _bioController,
          ),
          sizeVer(15),
          ButtonContainerWidget(
            text: 'Sign Up',
            color: blueColor,
            onTapListener: () {
              _signUpUser();
            },
          ),
          sizeVer(10),
          _isSigningUp == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Please wait...",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sizeHor(10),
                    const CircularProgressIndicator(),
                  ],
                )
              : const SizedBox(height: 0, width: 0),
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.signInPage, (route) => false);
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
    );
  }

  void _signUpUser() {
    setState(() {
      _isSigningUp = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signUpUser(
            user: UserEntity(
          email: _emailController.text,
          username: _userNameController.text,
          password: _passwordController.text,
          bio: _bioController.text,
          totalPosts: 0,
          totalFollowing: 0,
          followers: const [],
          totalFollowers: 0,
          profileUrl: "",
          website: "",
          following: const [],
          name: "",
          imageFile: _image,
        ))
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _userNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _bioController.clear();
      _isSigningUp = false;
    });
  }
}
