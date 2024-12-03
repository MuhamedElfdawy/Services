import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_services/core/logic/helper_methods.dart';

class ConfermEmailController
{
  Future<void> sendData(
      {
        required String email,
      }) async{
    try{
      final response = await Dio(BaseOptions(receiveDataWhenStatusError: true,validateStatus: (status) => true,)).post(
          'https://darwish1337-001-site1.gtempurl.com/Auth/ConfirmEmail',
          data: {
            'email' : email,
          }
      );
      print(response.data);
      if(response.statusCode == 200){
        ShowMessages(
            message: 'من فضلك قم بالتحقق من بريدك الإلكتروني للموافقة على إعادة تعيين كلمة المرور',
            style: TextStyle(fontSize: 16,color: Colors.green));
      }else{
        ShowMessages(
            message: 'Please verify your email address',
            style: TextStyle(fontSize: 18,color: Colors.red));
      }
    }catch (e){
      print(e);
      ShowMessages(message:e.toString(),style: TextStyle(fontSize: 18,color: Colors.white));
    }

  }
}