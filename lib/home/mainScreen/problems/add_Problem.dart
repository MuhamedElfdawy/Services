import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_image.dart';
import 'package:my_services/core/design/app_input.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/home/view.dart';
import 'package:my_services/main.dart';

class AddProblem extends StatefulWidget {
  const AddProblem({super.key});
  @override
  State<AddProblem> createState() => _AddProblemState();
}

class _AddProblemState extends State<AddProblem> {
  final descriptionProblemController = TextEditingController();
  final imageController = TextEditingController();
  File? imagePath;
  String? image;

  void addProblem() async {
    try {
      final token = prefs.getString('token');
      final userId = prefs.getString('Id');

      // if (token == null) {
      //   print('No token found');
      // }

      FormData formData = FormData.fromMap({
            'Description': descriptionProblemController.text,
            'ProblemImg': await MultipartFile.fromFile(imagePath!.path, filename: imagePath!.path.split('/').last),
            'UserId': userId,
            'CategoryId': 1,
      });

      final response = await Dio().post(
        'https://darwish1337-001-site1.gtempurl.com/api/Problem/AddProblem',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        data: formData
      );
      print(response.data);
      if (response.statusCode == 200) {
        ShowMessages(message: 'تم ارسال المشكلة', style: TextStyle(fontSize: 18,color: Colors.green));
        navigateTo(MainPage());
        // print('Data sent successfully: ${response.data}');
      } else {
        ShowMessages(message: 'حدثت مشكلة', style: TextStyle(fontSize: 18,color: Colors.red));
        print('Failed to add problem: ${response.statusCode}');
      }
    } on DioException catch (e) {
      ShowMessages(message: 'لم يتم ارسال المشكلة', style: TextStyle(fontSize: 18,color: Colors.red));
      // print('Error adding problem: ${e.message}');
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
                padding: EdgeInsets.only(right: 20,left: 20,top: 20),
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          navigateTo(MainPage());
                        },
                        child: Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.navigate_before,size: 30.sp,),
                        ),
                      ),
                      SizedBox(width: 50.w,),
                      Text(
                        "إضافة المشكلة",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: getMyMaterialColor(),
                            decoration: TextDecoration.none
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 34.h,),
                  Text('وصف المشكلة',
                    style: TextStyle(fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: getMyMaterialColor(),
                        decoration: TextDecoration.none,
                    ),),
                  SizedBox(height: 10.h,),
                  AppInput(
                    controller: descriptionProblemController,
                    hintText: 'وصف المشكلة*',
                    keyBord: TextInputType.multiline,
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    alignment: Alignment.center,
                    height: 177.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(strokeAlign: 1,color: getMyMaterialColor()),
                    ),
                    child:image != null? AppImage(path: image!, fit: BoxFit.fill,height: 177.h,width: 220.w,) : MainButton(
                    onPress: () async{
                      var file = await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
                      if(file != null){
                        imagePath = File(file.path);
                        image = file.path;
                        setState(() {});
                      }
                    },
                      width: 190.w,
                        name: 'إضافة صورة',
                        image: 'assets/images/camera.png',
                      color: Color(0xffFFEFCC),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text('تصنيف المشكلة',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: getMyMaterialColor(),decoration: TextDecoration.none),),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainButton(onPress: (){},
                          width: 165.w,
                          image: 'assets/images/Carpentry.png', name: 'نجارة'),
                      MainButton(onPress: (){},
                          width: 165.w,
                          image: 'assets/images/electricity.png', name: 'كهرباء'),
                    ],
                  ),
                  SizedBox(height: 18.h,),
                  Center(
                    child: MainButton(onPress: (){},
                        width: 165.w,
                        image: 'assets/images/Plumbing.png', name: 'سباكة'),
                  ),
                  SizedBox(height: 35.h,),
                  AppButton(onPressed: () async{
                    addProblem();
                  },
                      text: 'نشر المشكلة', bottomPadding: 30, topPadding: 35)
                ],
              ),
            ],
          )
      ),
    );
  }
}


class MainButton extends StatelessWidget {
  final onPress;
  final String name,image;
  final double?  width;
  final Color? color;
  const MainButton(
      {super.key,
    this.onPress,
    required this.name,
    required this.image,
     this.width,
     this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 45.h,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,height: 24.h,width: 24.w,),
            SizedBox(width: 8.w),
            Text(
              name,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff35618E)),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}