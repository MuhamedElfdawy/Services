import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double bottomPadding, topPadding;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.bottomPadding,
      required this.topPadding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          bottom: bottomPadding,
        ),
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: getMyMaterialColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)
            )
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
