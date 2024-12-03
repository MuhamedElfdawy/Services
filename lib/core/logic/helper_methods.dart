import 'package:flutter/material.dart';
import 'package:my_services/main.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page) {
  Navigator.pushReplacement(
    navigatorKey.currentContext!,
    MaterialPageRoute(builder: (context) => page),
  );

}




void ShowMessages({required String message,required TextStyle style}){
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Center(child: Text(message,style: style,)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: getMyMaterialColor(),
        duration: Duration(seconds: 4),
      )
  );
}