import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/confirmemail/view.dart';
import 'package:my_services/auth/login/model.dart';
import 'package:my_services/auth/selection/view.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_input.dart';
import 'package:my_services/core/design/app_text.dart';
import 'package:my_services/core/logic/dio_helper.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/home/view.dart';
import 'package:my_services/main.dart';
import 'package:my_services/models/users.dart';

class Login extends StatefulWidget {
   const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final navigatorKey = GlobalKey<NavigatorState>();
  bool isLoading = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  void login() async{
    final response = await DioHelper().sendData('Login', data: {
                 'email' : emailController.text,
                 'password' : passowrdController.text,
                  },
    );
    // print(response?.response?.data);
    if(response!.isSuccess){
      final model = UserTokenData.fromJson(response.response!.data);
      prefs.setString('token' , '${model.token}');
      prefs.setString('email' , '${model.email}');
      prefs.setString('Id' , '${model.userId}');
      prefs.setString('goverName' , '${model.goverName}');
      prefs.setString('cityName' , '${model.cityName}');
      prefs.setString('isAuthenticated' , '${model.isAuthenticated}');
      prefs.setString('roles' , '${model.roles}');
      prefs.setString('refreshTokenExpiration' , '${model.refreshTokenExpiration}');
      prefs.setString('expiresOn' , '${model.expiresOn}');
      ShowMessages(message: 'تم تسجيل الدخول بنجاح',style: TextStyle(fontSize: 18,color: Colors.green));
       navigateTo(MainPage());
    }else{
      ShowMessages(message: 'هذا الحساب غير مسجل لدينا',style: TextStyle(fontSize: 18,color: Colors.red));
    }
    isLoading = false;
    setState(() {});
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
            fit: BoxFit.cover,
          ),
          Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.only(right: 20, left: 20),
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
                      height: 7.h,
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: getMyMaterialColor()),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: 'البريد الالكتروني'),
                    SizedBox(
                      height: 16.h,
                    ),
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
                    AppText(text: 'كلمة المرور'),
                    SizedBox(
                      height: 16.h,
                    ),
                     AppInput(
                      controller: passowrdController,
                      validate: (value) {
                        if(value!.isEmpty){
                          return 'من فضلك ادخل كلمة المرور';
                        }
                        return null;
                      },
                      hintText: '********',
                      isPassword: true,
                    ),
                    TextButton(
                      onPressed: () {
                        navigateTo(ConfrimEmail());
                      },
                      child: AppText(text: 'لقد نسيت كلمة المرور'),
                    ),
                    AppButton(
                            onPressed: () async {
                              if(formKey.currentState!.validate()){
                                login();
                              }
                              isLoading = false;
                              setState(() {});
                            },
                            text: 'تسجيل ',
                            topPadding: 24,
                            bottomPadding: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 1.h,
                          width: 140.w,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xff224A6B), Colors.white],
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.topEnd),
                            ),
                          ),
                        ),
                        Text('أو',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 1.h,
                          width: 140.w,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white, Color(0xff224A6B)],
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.topEnd),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Mcontainer(
                          text: 'google',
                          name: 'google.png',
                        ),
                        Mcontainer(
                          text: 'facebook',
                          name: 'facebook.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'انا لا امتلك حساب',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.normal),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(Selection());
                          },
                          child: AppText(text: 'إنشاء حساب'),
                        ),
                      ],
                    )
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

class Mcontainer extends StatelessWidget {
  final String text, name;

  const Mcontainer({super.key, required this.text, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 67.h,
        width: 160.w,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            border:
                Border.fromBorderSide(BorderSide(color: getMyMaterialColor()))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: getMyMaterialColor()),
            ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(color: getMyMaterialColor())),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/$name'),
            )
          ],
        ),
      ),
    );
  }
}