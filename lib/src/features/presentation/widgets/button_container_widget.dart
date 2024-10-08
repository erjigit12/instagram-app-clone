import 'package:flutter/material.dart';
import 'package:instagram_app_clone/src/core/consts/consts.dart';

class ButtonContainerWidget extends StatelessWidget {
  const ButtonContainerWidget({
    super.key,
    this.color,
    this.text,
    this.onTapListener,
  });

  final Color? color;
  final String? text;
  final VoidCallback? onTapListener;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapListener,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            "$text",
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
