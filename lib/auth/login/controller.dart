import 'package:dio/dio.dart';

class LoginController
{
  Future<String> sendData({required String phone,required String password}) async{

      final response = await Dio(BaseOptions(receiveDataWhenStatusError: true,validateStatus: (status) => true,)).post('https://10.0.2.2:44379/api/Account/Login',
          data: {
            'email' : phone,
            'password' : password,
          }
      );
      print(response.data);
      return response.data;
  }
}