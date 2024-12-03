import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';

class AppContact extends StatefulWidget {
  final String? image;
  final Function() onPress;
  AppContact({super.key, this.image, required this.onPress});

  @override
  State<AppContact> createState() => _AppContactState();
}
class _AppContactState extends State<AppContact> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40.h,
      width: 130.w,
      child: ElevatedButton(
        onPressed: widget.onPress,
        child: Image.asset(widget.image!,
          height: 24.h,
          width: 24.w,
          color: Color(0xff35618E),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: getMyMaterialColor()),
          ),
        ),
      ),
    );
  }
}