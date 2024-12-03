import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/login/view.dart';
import 'package:my_services/auth/register/view.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/main.dart';

class Selection extends StatelessWidget {
  const Selection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20,top: 20),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      color: getMyMaterialColor(),
                      height: 94.h,
                      width: 113.w,
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      'من أنت؟',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: getMyMaterialColor(),
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainContainer(name: 'electrician.png', text: 'فني',
                          onPress: (){navigateTo(Register(isFactor: true,));},),
                        MainContainer(name: 'client.png', text: 'مستخدم',
                          onPress: (){navigateTo(Register(isFactor: false,));},),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  final String name,text;
  final onPress;

  const MainContainer({super.key, required this.name, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 146,
          width: 145,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Image.asset('assets/images/$name'),
        ),
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          height: 40.h,
          width: 150.w,
          child: ElevatedButton(
            onPressed: onPress,
            child:  Text(
              text,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: getMyMaterialColor()),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff35618E),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
                side: BorderSide(color: getMyMaterialColor()),
              ),
            ),
          ),
        )
      ],
    );
  }
}