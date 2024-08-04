import 'package:flutter/material.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('HomePage'),
        centerTitle: true,
      ),
    );
  }
}
