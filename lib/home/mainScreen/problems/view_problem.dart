import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_image.dart';
import 'package:my_services/core/design/app_input.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/home/view.dart';
import 'package:my_services/main.dart';

class ViewProblem extends StatefulWidget {
  const ViewProblem({super.key});
  @override
  State<ViewProblem> createState() => _ViewProblemState();
}

class _ViewProblemState extends State<ViewProblem> {
  String? imagePath;

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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

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
                        SizedBox(width: 60.w,),
                        Text(
                          "المشكلة المنشورة",
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 500.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24.r,
                                    backgroundImage: NetworkImage('https://th.bing.com/th?id=OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK&w=187&h=333&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                                    // child: AppImage(path: 'assets/images/client.png', fit: BoxFit.cover,height: 50,width: 50,),
                                  ),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Text(
                                    'نجارة',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff35618E)),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 40.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xffD6EAFF),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Image.asset('assets/images/Carpentry.png'),
                              )
                            ],
                          ),
                          Text(
                            'المفتاح اتكسر في كالون الباب و محتاج حد يصلحو',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff35618E)),
                          ),
                          TextButton(
                            onPressed: () {
                              // navigateTo(ViewProblem());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'المزيد  >',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff35618E)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )


              // ListView(
              //   padding: EdgeInsets.only(right: 20,left: 20,top: 20),
              //   children: [
              //     Row(
              //       children: [
              //         InkWell(
              //           onTap: (){
              //             navigateTo(MainPage());
              //           },
              //           child: Container(
              //             height: 48.h,
              //             width: 48.w,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(16),
              //             ),
              //             child: Icon(Icons.navigate_before,size: 30.sp,),
              //           ),
              //         ),
              //         SizedBox(width: 50.w,),
              //         Text(
              //           "إضافة المشكلة",
              //           style: TextStyle(
              //               fontSize: 20.sp,
              //               fontWeight: FontWeight.bold,
              //               color: getMyMaterialColor(),
              //               decoration: TextDecoration.none
              //           ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(height: 34.h,),
              //     Text('اسم المشكلة',
              //       style: TextStyle(fontSize: 20.sp,
              //         fontWeight: FontWeight.bold,
              //         color: getMyMaterialColor(),
              //         decoration: TextDecoration.none,),),
              //     SizedBox(height: 10.h,),
              //     AppInput(
              //
              //       hintText: 'اسم المشكلة',
              //       isEnabled: true,),
              //     SizedBox(height: 16.h,),
              //     Text('وصف المشكلة',
              //       style: TextStyle(fontSize: 20.sp,
              //         fontWeight: FontWeight.bold,
              //         color: getMyMaterialColor(),
              //         decoration: TextDecoration.none,
              //       ),),
              //     SizedBox(height: 10.h,),
              //     AppInput(
              //       hintText: 'وصف المشكلة*',
              //       keyBord: TextInputType.multiline,
              //     ),
              //     SizedBox(height: 16.h,),
              //     Container(
              //       alignment: Alignment.center,
              //       height: 177.h,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         border: Border.all(strokeAlign: 1,color: getMyMaterialColor()),
              //       ),
              //       child:imagePath != null? AppImage(path: imagePath!, fit: BoxFit.fill,height: 177.h,width: 220.w,) : MainButton(
              //         onPress: () async{
              //           var file = await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
              //           if(file != null){
              //             imagePath = file.path;
              //             setState(() {});
              //           }
              //         },
              //         width: 190.w,
              //         name: 'إضافة صورة',
              //         image: 'assets/images/camera.png',
              //         color: Color(0xffFFEFCC),
              //       ),
              //     ),
              //     SizedBox(height: 10.h,),
              //     Text('تصنيف المشكلة',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: getMyMaterialColor(),decoration: TextDecoration.none),),
              //     SizedBox(height: 20.h,),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         MainButton(onPress: (){},
              //             width: 165.w,
              //             image: 'assets/images/Carpentry.png', name: 'نجارة'),
              //         MainButton(onPress: (){},
              //             width: 165.w,
              //             image: 'assets/images/electricity.png', name: 'كهرباء'),
              //       ],
              //     ),
              //     SizedBox(height: 18.h,),
              //     Center(
              //       child: MainButton(onPress: (){},
              //           width: 165.w,
              //           image: 'assets/images/Plumbing.png', name: 'سباكة'),
              //     ),
              //     AppButton(onPressed: () async{
              //
              //     },
              //         text: 'نشر المشكلة', bottomPadding: 30, topPadding: 35)
              //   ],
              // ),
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