import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/login/view.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/home/view.dart';
import 'package:my_services/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key,});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      (prefs.getString('token')??'').isEmpty?
      navigateTo(Login()): navigateTo(MainPage());
    }
    );
  }


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
            Center(
              child: FadeInDownBig(
                child: SpinPerfect(
                  child: Image.asset(
                    'assets/images/logo.png',
                    color: getMyMaterialColor(),
                    height: 300.h,
                    width: 300.w,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}