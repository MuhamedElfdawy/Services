import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/core/design/app_contact.dart';
import 'package:my_services/main.dart';
import 'package:my_services/models/categories.dart';
import 'package:my_services/models/problems.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  final token = prefs.getString('token');
  late List<GetCategoriesSlider> listCategory;
  late List<GetPostsData> listPosts;

  bool isLoadingCategory = true;
  bool isLoadingProblem = true;

  @override
  void initState() {
    super.initState();
    getCategories();
    getProblems();
  }

  Future<void> getCategories () async{
    final response = await Dio().get('https://darwish1337-001-site1.gtempurl.com/Category/GetCategoriesWithProblem',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      )
    );
    listCategory = List<GetCategoriesSlider>.from((response.data as List).map((e) => GetCategoriesSlider.fromJson(e))).toList();
    isLoadingCategory = false;
    setState(() {});
  }
  Future<void> getProblems () async{
    final response = await Dio().get('https://darwish1337-001-site1.gtempurl.com/Category/GetCategoriesWithProblemsById/1',
      options: Options(
      headers: {
      'Authorization': 'Bearer $token',
      })
    );
    listPosts = List<GetPostsData>.from((response.data as List).map((e) => GetPostsData.fromJson(e))).toList();
    print(listPosts[0].problems?.length);
    isLoadingProblem = false;
    setState(() {});
  }

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
                Image.asset(
                  'assets/images/logo.png',
                  color: getMyMaterialColor(),
                  height: 94,
                  width: 113,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 48.h,
                      width: 290.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          iconSize: 30,
                          color: const Color(0xff42739B)),
                    ),
                    // SizedBox(width: 11.w),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24.r,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_alert_outlined),
                        color: const Color(0xff42739B),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'تصنيف المشكلة',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: getMyMaterialColor()),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 102,
              width: double.infinity,
              child: isLoadingCategory? Center(child: CircularProgressIndicator(color: getMyMaterialColor()),) : ListView.builder(
               scrollDirection: Axis.horizontal, 
                itemCount: listCategory.length,
                itemBuilder: (context, index) => Categories(model: listCategory[index]),),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  'المشاكل المنشورة',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: getMyMaterialColor()),
                ),
                SizedBox(
                  height: 10.h,
                ),
                 Container(
                   height: 600,
                   padding: const EdgeInsets.only(bottom: 35),
                   child: isLoadingProblem? Center(child: CircularProgressIndicator(color: getMyMaterialColor()),) :  ListView.builder(
                     itemCount: listPosts.length,
                       itemBuilder: (context, index) => Pcontainer(model: listPosts[index]),),
                 )
              ],),
            )
          ],
        )
      ],
    ));
  }
}

class Pcontainer extends StatelessWidget {
  final GetPostsData model;

   Pcontainer({super.key, required this.model});
  String? roles = prefs.getString('roles');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 430,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(model.problems?[7].user?.displayName??
                        'Name',
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
                    child: Image.network('https://darwish1337-001-site1.gtempurl.com/${model.imagePath.toString()}'),
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
              SizedBox(height: 15.h,),
              Text(
                'صورة المشكلة',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff35618E)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 150.h,
                width: 350.w,
                child: Image.network('https://darwish1337-001-site1.gtempurl.com/${model.imagePath.toString()}'),
                decoration: BoxDecoration(
                  border: Border.all(color: getMyMaterialColor(),strokeAlign: 1)
                ),
              ),
              SizedBox(height: 15.h,),
              Center(
                child: roles == '[Customer]'? null : AppContact(onPress: (){
                        _WhatsAppChat(
                        phoneNumber: '201008036610');},
                          image: 'assets/images/whatsapp.png',),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               MainButton(onPress: (){print(model.imagePath);}, name:  'قيد  الطلب',color: Color(0xff35618E),width: 155,),
               MainButton(onPress: (){}, name: 'حذف المشكلة',color: Colors.red,),
              ],)
            ],
          ),
        ),
        SizedBox(height: 20.h,)
      ],
    );
  }
}

class Categories extends StatelessWidget {
  final GetCategoriesSlider model;
  
  const Categories({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        height: 80.h,
        width: 170.w,
        child: Row(
          children: [
            ElevatedButton(
              onPressed: (){},
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://darwish1337-001-site1.gtempurl.com/${model.catImage}',
                    color: Color(0xff42739B),
                    height: 48.h,
                    width: 48.w,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 7.h,),
                  Text(
                    model.name.toString(),
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff42739B)),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
            SizedBox(width: 16.w,)
          ],
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final onPress;
  final String name;
  final double?  width;
  final Color? color;
  const MainButton(
      {super.key,
        this.onPress,
        required this.name,
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
        child:  Text(
          name,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: getMyMaterialColor()),
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

void _WhatsAppChat({required String phoneNumber}) async{
  var url = 'https://wa.me/$phoneNumber?text=مرحبا';
  await launch(url);
}