import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/core/design/app_contact.dart';
import 'package:my_services/core/logic/dio_helper.dart';
import 'package:my_services/main.dart';
import 'package:my_services/models/factor.dart';
import 'package:my_services/models/users.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneBook extends StatefulWidget {
  const PhoneBook({super.key});

  @override
  State<PhoneBook> createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  late List<GetFactorData> list;
  final token = prefs.getString('token');

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  Future<void> getData() async {
    final response = await Dio().get(
        'https://darwish1337-001-site1.gtempurl.com/Users/GetUsersInFactorRole',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      );
    list = List<GetFactorData>.from((response.data as List).map((e) => GetFactorData.fromJson(e))).toList();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff35618E),
        centerTitle: true,
        title: Text(
          'دليل الفني',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: getMyMaterialColor()),
        ),

      ),
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
                padding: const EdgeInsets.only(bottom: 40),
                child: isLoading ? Center(child: CircularProgressIndicator(
                  color: getMyMaterialColor(),),) :
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) =>
                      phoneContainer(model: list[index]),
                  itemCount: list.length,
                ),
              ),

            ],
          )),

    );
  }
}


class phoneContainer extends StatelessWidget {
  final GetFactorData model;

  phoneContainer({super.key, required this.model});

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
              radius: 24.r,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th?id=OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK&w=187&h=333&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                // child: AppImage(path: 'assets/images/client.png', fit: BoxFit.cover,height: 50,width: 50,),
              ),
              SizedBox(
                width: 13.w,
              ),
              Text(
                model.displayName.toString(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff35618E)),
              )
            ],
          ),
          if(model.job != null)
              InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) =>
                    SimpleDialog(
                      contentPadding: EdgeInsets.all(16),
                      title: Center(child: Text(model.job?.name??'')),

                      titleTextStyle: TextStyle(fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: getMyMaterialColor()),
                      children: [
                        Text('محافظة ${prefs.getString('goverName')}'),
                        Text('مدينة ${prefs.getString('cityName')}'),
                      ],
                    ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 40.h,
                width: 55.w,
                decoration: BoxDecoration(
                  color: const Color(0xffD6EAFF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.network('https://darwish1337-001-site1.gtempurl.com/${model.job?.imagePath.toString()}'),
              ),
            ),
          ],
        ),
        Text(
          model.phoneNumber.toString(),
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff35618E)),
        ),
        SizedBox(
          height: 10.w,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppContact(
              onPress: () {
                _PhoneCall(
                  phoneNumber: '2${model.phoneNumber.toString()}',
                );
              },
              image: 'assets/images/phone.png',),
            AppContact(
              onPress: () {
                _WhatsAppChat(
                    phoneNumber: '2${model.phoneNumber.toString()}'
                );
              },
              image: 'assets/images/whatsapp.png',),
          ],
        )
      ],
    ) ,
    ),
    SizedBox(
    height: 24.w,
    )
    ,
    ]
    ,
    );
  }
}


void _WhatsAppChat({required String phoneNumber}) async {
  var url = 'https://wa.me/$phoneNumber?text=مرحبا';
  await launch(url);
}

void _PhoneCall({required String phoneNumber}) async {
  final Uri url = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(url);
}