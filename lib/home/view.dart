import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/home/mainScreen/problems/add_Problem.dart';
import 'package:my_services/home/mainScreen/view.dart';
import 'package:my_services/home/myAccount/view.dart';
import 'package:my_services/home/phoneBook/view.dart';
import 'package:my_services/home/record/view.dart';
import 'package:my_services/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? roles = prefs.getString('roles');
  int currentIndex = 0;
  List<Widget> pages = [
     MainScreen(),
     RecordScreen(),
     PhoneBook(),
     MyAccount()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // bottomNavigationBar: ,
          // body: pages[currentIndex],
          floatingActionButton: roles == '[Factor]'? null : FloatingActionButton(
            onPressed: (){
              navigateTo(AddProblem());
            },
            isExtended: true,
            shape: CircleBorder(),
            backgroundColor: getMyMaterialColor(),
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Stack(
            children: [
              IndexedStack(
                index: currentIndex,
                children: pages,
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                    child: Opacity(
                      opacity: 0.7,
                      child: BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          currentIndex: currentIndex,
                          fixedColor: const Color(0xff42739B),
                          elevation: 0,
                          iconSize: 26,
                          onTap: (value) {
                            currentIndex = value;
                            setState(() {});
                          },
                          items: const [
                            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'الرئيسية'),
                            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined),label: 'السجل'),
                            BottomNavigationBarItem(icon: Icon(Icons.contact_phone_outlined),label: 'دليل الهاتف'),
                            BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined),label: 'حسابي'),
                          ]
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}