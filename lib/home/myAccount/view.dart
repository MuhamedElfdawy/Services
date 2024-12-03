import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/login/view.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_text.dart';
import 'package:my_services/core/logic/dio_helper.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/main.dart';
import 'package:my_services/models/users.dart';

class MyAccount extends StatefulWidget {
   const MyAccount({super.key,});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String? userName;
  bool isLoading = false;


  @override
  void initState(){
    super.initState();
    getUserData();
  }

  void getUserData() async {
    try {
      final token = prefs.getString('token');

      // if (token == null) {
      //   print('No token found');
      //   return null;
      // }
// print(token);
      final response = await Dio().get(
        'https://darwish1337-001-site1.gtempurl.com/Users/GetCurrentUser',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      // print(response.data);
      if (response.statusCode == 200) {
        userName = response.data['displayName'];
        setState(() {});
        return response.data;
      } else {
        print('Failed to get user data: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      print('Error fetching user data: ${e.message}');
      return null;
    }
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
              ListView(
                children: [
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 37.r,
                          backgroundImage: NetworkImage('https://th.bing.com/th?id=OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK&w=187&h=333&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                        ),
                        SizedBox(width: 20.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(userName??'Name',style: TextStyle(fontSize: 25,color: getMyMaterialColor()),),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    AppText(text: 'التصليحات'),
                                    AppText(text: '15'),
                                  ],
                                ),
                                SizedBox(width: 16.w,),
                                Column(
                                  children: [
                                    AppText(text: 'الطلبات'),
                                    AppText(text: '15'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r),
                          bottomLeft: Radius.circular(30.r))
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: 'المعلومات الشخصية',size: 14,color: Colors.amber.withOpacity(0.1),),
                        SizedBox(height: 24.h,),
                        MainRow(onPress: (){},icon: Icons.person, text: 'تغير المعلومات الشخصية',),
                        MainRow(onPress: (){},icon: Icons.favorite_border, text: 'المفضلة',),
                        MainRow(onPress: (){},icon: Icons.location_on_outlined, text: 'عناويني',),
                        SizedBox(height: 10.h,),
                        AppText(text: 'المساعدة والدعم',size: 14,color: Colors.amber.withOpacity(0.1),),
                        SizedBox(height: 24.h,),
                        MainRow(onPress: (){},icon: Icons.list_alt, text: 'شروط الاستخدام',),
                        MainRow(onPress: (){},icon: Icons.phone, text: 'تواصل معنا',),
                        MainRow(onPress: (){},icon: Icons.question_mark, text: 'سياسة الخصوصية',),
                        AppButton(onPressed: (){
                          prefs.clear();
                          setState(() {});
                          navigateTo(Login());
                        },
                            text: 'تسجيل خروج',
                            bottomPadding: 40, topPadding: 50)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
      ),
    );
  }
}

class MainRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPress;
  const MainRow({super.key, required this.icon, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: InkWell(
        onTap: onPress,
        focusColor: getMyMaterialColor(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,color: getMyMaterialColor(),),
                SizedBox(width: 13.w,),
                Text(text,
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: getMyMaterialColor(),
                  ),)
        
              ],
            ),
            Icon(Icons.navigate_next,size: 35,color: getMyMaterialColor(),)
          ],
        ),
      ),
    );
  }
}
