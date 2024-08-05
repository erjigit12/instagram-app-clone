import 'package:flutter/material.dart';
import 'package:instagram_app_clone/profile_widget.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';
import 'package:instagram_app_clone/src/features/presentation/widgets/form_container_widget.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _isReplaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Comment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    sizeHor(10),
                    const Text(
                      "UserName",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                sizeVer(10),
                const Text(
                  "This is very beautiful place",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          sizeVer(10),
          const Divider(color: secondaryColor),
          sizeVer(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  sizeHor(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Username",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                  color: secondaryColor,
                                )),
                          ],
                        ),
                        const Text(
                          "This  is comment",
                          style: TextStyle(color: primaryColor),
                        ),
                        sizeVer(4),
                        Row(
                          children: [
                            const Text(
                              "08/02/2022",
                              style:
                                  TextStyle(color: darkGreyColor, fontSize: 12),
                            ),
                            sizeHor(15),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isReplaying = !_isReplaying;
                                });
                              },
                              child: const Text(
                                "Replay",
                                style: TextStyle(
                                    color: darkGreyColor, fontSize: 12),
                              ),
                            ),
                            sizeHor(15),
                            const Text(
                              "View Replays",
                              style:
                                  TextStyle(color: darkGreyColor, fontSize: 12),
                            ),
                          ],
                        ),
                        _isReplaying == true ? sizeVer(10) : sizeVer(0),
                        _isReplaying == true
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const FormContainerWidget(
                                    hintText: "Post your replay...",
                                  ),
                                  sizeVer(10),
                                  const Text(
                                    "Post",
                                    style: TextStyle(color: blueColor),
                                  ),
                                ],
                              )
                            : const SizedBox(width: 0, height: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _commentSection(),
        ],
      ),
    );
  }

  _commentSection() {
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: profileWidget(),
              ),
            ),
            sizeHor(10),
            Expanded(
                child: TextFormField(
              style: const TextStyle(color: primaryColor),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Post your comment...",
                  hintStyle: TextStyle(color: secondaryColor)),
            )),
            GestureDetector(
                onTap: () {},
                child: const Text(
                  "Post",
                  style: TextStyle(fontSize: 15, color: blueColor),
                ))
          ],
        ),
      ),
    );
  }
}
