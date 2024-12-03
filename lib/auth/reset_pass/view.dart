import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_input.dart';
import 'package:my_services/main.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}
class _ResetPasswordState extends State<ResetPassword> {
  bool isLoading = false;
  final passwordController = TextEditingController();
  final ConfrimpasswordController = TextEditingController();

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
                fit: BoxFit.cover,
              ),
              ListView(
                padding: const EdgeInsets.only(top: 20,right: 20, left: 20),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        color: getMyMaterialColor(),
                        height: 94,
                        width: 113,
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Text(
                        'إدخال كلمة المرور الجديدة',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: getMyMaterialColor()),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'برجاء إدخال كلمة المرور الجديدة',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: getMyMaterialColor(),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppInput(
                        hintText: '********',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'أعد كتابة كلمة المرور الجديدة',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: getMyMaterialColor(),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppInput(
                        hintText: '********',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      AppButton(
                          onPressed: ()  {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:  Center(child: Text("succes")),
                              backgroundColor: getMyMaterialColor(),
                              duration: const Duration(seconds: 1),
                            ));
                          },
                          text: 'ارسال',
                          topPadding: 24,
                          bottomPadding: 36),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}




