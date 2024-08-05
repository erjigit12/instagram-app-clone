import 'package:flutter/material.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Activity',
          style: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
