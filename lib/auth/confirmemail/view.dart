import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/confirmemail/controller.dart';
import 'package:my_services/auth/login/view.dart';
import 'package:my_services/auth/reset_pass/view.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_input.dart';
import 'package:my_services/core/design/app_text.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/main.dart';

class ConfrimEmail extends StatefulWidget {
  const ConfrimEmail({super.key});

  @override
  State<ConfrimEmail> createState() => _ConfrimEmailState();
}
class _ConfrimEmailState extends State<ConfrimEmail> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
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
              Form(
                key: formKey,
                child: ListView(
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
                          'هل نسيت كلمة المرور',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: getMyMaterialColor()),
                        ),
                        SizedBox(
                          height: 55.h,
                        ),
                        AppText(text: 'برجاء إدخال البريد الالكتروني لاعادة اعداد كلمة المرور'),
                        SizedBox(
                          height: 22.h,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AppInput(
                          controller: emailController,
                          hintText: 'مثال : mo@gmail.com',
                          validate: (value) {
                            if(value!.isEmpty){
                              return 'من فضلك ادخل البريد الالكتروني';
                            }else if(value.contains('@')){
                              return null;
                            }else {
                              return 'ادخل البريد الالكتروني صحيح';
                            }
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        AppButton(
                            onPressed: ()  async{
                              if(formKey.currentState!.validate()){
                                final controller = ConfermEmailController();
                                await controller.sendData(email: emailController.text);
                                // navigateTo(Login());
                              }
                            },
                            text: 'ارسال',
                            topPadding: 24,
                            bottomPadding: 36),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}




