import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/login/view.dart';
import 'package:my_services/main.dart';

class Selction extends StatelessWidget {
  const Selction({super.key});

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
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 94.h,
                      width: 113.w,
                    ),
                    SizedBox(
                      height: 123.h,
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
                      height: 23.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainContainer(name: 'electrician.png'),
                        MainContainer(name: 'client.png')
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainButton(name: 'فني'),
                        MainButton(name: 'مستخدم')
                      ],
                    )
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
  final String name;

  const MainContainer({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: 145,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Image.asset('assets/images/$name'),
    );
  }
}

class MainButton extends StatelessWidget {
  final String name;

  const MainButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 38,
        width: 145,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              side: BorderSide(
                style: BorderStyle.solid,
                color: getMyMaterialColor(),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.all(Radius.circular(16.r)),side: BorderSide(width: 20.w)),
          ),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: getMyMaterialColor()),
          ),
        ),
      ),
    );
  }
}
