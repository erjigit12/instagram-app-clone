import 'package:flutter/material.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/features/presentation/page/profile/widgets/profile_form_widget.dart';

class UpdatePostPage extends StatelessWidget {
  const UpdatePostPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Edit Post'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.done, color: blueColor, size: 28),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              sizeVer(10),
              const Text(
                "Username",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizeVer(10),
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                ),
              ),
              sizeVer(10),
              const ProfileFormWidget(
                title: "Description",
              )
            ],
          ),
        ),
      ),
    );
  }
}
