import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_services/core/logic/helper_methods.dart';

class DioHelper
{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://darwish1337-001-site1.gtempurl.com/Auth/'
    ),
  );

  Future<CustomResponse?> sendData(String endPoint, {Map<String, dynamic>? data}) async{
    try{
      final response = await _dio.post(
        endPoint,
        data: data
      );
      if(response.statusCode == 200){
        return CustomResponse(
            message: 'تم تسجيل الدخول بنجاح',
            isSuccess: true,
            response: response,
        );
      }
    }on DioException catch(e){
      ShowMessages(message: 'هذا الحساب غير مسجل لدينا', style: TextStyle(fontSize: 18,color: Colors.red));
      // print(e.message);
      return CustomResponse(
          message: e.response!.data,
          isSuccess: false,
        response: e.response,
      );
    }
    return null;
  }

  Future getData({required String endPoint}) async{
      try{
        final response = await _dio.get(endPoint);
        print(response.data);
      }on DioException catch(e){
        // print(e.response!.data);
        return e.response!.data;
      }
      return null;
    }

}


class CustomResponse {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  CustomResponse({required this.message, required this.isSuccess, this.response});
}
