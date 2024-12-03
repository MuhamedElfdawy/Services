import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
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
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'سجل المشاكل',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: getMyMaterialColor()),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Column(
                        children: List.generate(2, (index) => const Pcontainer()),
                      )
                    ],),
                )
              ],
            )
          ],
        ));
  }
}

class Pcontainer extends StatefulWidget {
  const Pcontainer({super.key});

  @override
  State<Pcontainer> createState() => _PcontainerState();
}
class _PcontainerState extends State<Pcontainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 150,
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
                        backgroundColor: const Color(0xff35618E),
                        radius: 24.r,
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        'اسم المشكلة',
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
                'وصف بسيط عن المشكلة',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff35618E)),
              ),
              TextButton(
                onPressed: () {},
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
                  ],),),
            ],
          ),
        ),
        SizedBox(height: 20.h,)
      ],
    );
  }
}

