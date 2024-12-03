
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/design/app_Button.dart';
import 'package:my_services/design/app_input.dart';
import 'package:my_services/main.dart';

class Problem extends StatefulWidget {
  const Problem({super.key});

  @override
  State<Problem> createState() => _ProblemState();
}

class _ProblemState extends State<Problem> {

  final nameProblem = TextEditingController();
  final discrebtionnameProblem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            ListView(
              padding: const EdgeInsets.only(right: 20, left: 20,top: 40),
              children: [
               Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     height: 48.h,
                     width: 48.w,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(16),
                     ),
                     child: Icon(Icons.navigate_before,size: 30.sp,),
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
                Text('اسم المشكلة',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: getMyMaterialColor(),decoration: TextDecoration.none),),
                SizedBox(height: 10.h,),
                 AppInput(hintText: 'اسم المشكلة', controller: nameProblem,),
                SizedBox(height: 16.h,),
                Text('وصف المشكلة',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: getMyMaterialColor(),decoration: TextDecoration.none),),
                SizedBox(height: 10.h,),
                 AppInput(hintText: 'وصف المشكلة*', controller: discrebtionnameProblem,),
                SizedBox(height: 16.h,),
                Container(
                  alignment: Alignment.center,
                  height: 177.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(strokeAlign: 1,color: getMyMaterialColor()),
                  ),
                  child: Container(
                    height: 44.h,
                    width: 165.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFEFCC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/camera.png',height: 24.h,width: 24.w,color: getMyMaterialColor()),
                        Text('إضافة صورة',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: getMyMaterialColor(),decoration: TextDecoration.none),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('تصنيف المشكلة',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: getMyMaterialColor(),decoration: TextDecoration.none),),
                SizedBox(height: 20.h,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Mcontainer(image: 'assets/images/Carpentry.png', name: 'نجارة'),
                    Mcontainer(image: 'assets/images/electricity.png', name: 'كهرباء'),
                  ],
                ),
                SizedBox(height: 18.h,),
                const Center(
                  child: Mcontainer(image: 'assets/images/Plumbing.png', name: 'سباكة'),
                ),
                AppButton(onPressed: (){}, text: 'نشر المشكلة', bottomPadding: 30, topPadding: 35)
              ],
            )
          ],
        )
    );
  }
}








class Mcontainer extends StatefulWidget {
  final String image,name;
  const Mcontainer({super.key,
    required this.image,
    required this.name
  });

  @override
  State<Mcontainer> createState() => _McontainerState();
}
class _McontainerState extends State<Mcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 165.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.image,height: 24.h,width: 24.w,),
          Text(widget.name,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: const Color(0xff083460),decoration: TextDecoration.none),),

        ],
      ),
    );
  }
}
