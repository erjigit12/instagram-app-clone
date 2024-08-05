import 'package:flutter/material.dart';

import 'package:instagram_app_clone/profile_widget.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/features/presentation/page/profile/profile_form_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController? _nameController;
  TextEditingController? _usernameController;
  TextEditingController? _websiteController;
  TextEditingController? _bioController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Edit Profile"),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              size: 32,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.done,
                color: blueColor,
                size: 32,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: profileWidget(),
                  ),
                ),
              ),
              sizeVer(15),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Change profile photo",
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              sizeVer(15),
              ProfileFormWidget(title: "Name", controller: _nameController),
              sizeVer(15),
              ProfileFormWidget(
                  title: "Username", controller: _usernameController),
              sizeVer(15),
              ProfileFormWidget(
                  title: "Website", controller: _websiteController),
              sizeVer(15),
              ProfileFormWidget(title: "Bio", controller: _bioController),
              sizeVer(10),
              // _isUpdating == true
              //     ? Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           const Text(
              //             "Please wait...",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           sizeHor(10),
              //           const CircularProgressIndicator()
              //         ],
              //       )
              //     : Container(
              //         width: 0,
              //         height: 0,
              //       ),
            ],
          ),
        ),
      ),
    );
  }

  // _updateUserProfileData() {
  //   setState(() => _isUpdating = true);
  //   if (_image == null) {
  //     _updateUserProfile("");
  //   } else {
  //     di
  //         .sl<UploadImageToStorageUseCase>()
  //         .call(_image!, false, "profileImages")
  //         .then((profileUrl) {
  //       _updateUserProfile(profileUrl);
  //     });
  //   }
  // }

  // _updateUserProfile(String profileUrl) {
  //   BlocProvider.of<UserCubit>(context)
  //       .updateUser(
  //           user: UserEntity(
  //               uid: widget.currentUser.uid,
  //               username: _usernameController!.text,
  //               bio: _bioController!.text,
  //               website: _websiteController!.text,
  //               name: _nameController!.text,
  //               profileUrl: profileUrl))
  //       .then((value) => _clear());
  // }

  // _clear() {
  //   setState(() {
  //     _isUpdating = false;
  //     _usernameController!.clear();
  //     _bioController!.clear();
  //     _websiteController!.clear();
  //     _nameController!.clear();
  //   });
  //   Navigator.pop(context);
  // }
}
