import 'package:dio/dio.dart';

class RegisterController{
  Future<void> sendData(String username, String password, String confirmpass, String email) async{
    try{
      final response = await Dio().post('http://localhost:56693/api/Account/Registration',
          data: {
            "username" : username,
            "password" : password,
            "email" : email,
            'confrimPassword' : confirmpass

            // "firstName": firstName,
            // "lastName": lastName,
            // "email": email,
            // "phone": phone,
            // "password": password,
            // "city": city,
            // "governorate": governorate,
            // "factorJob": factorJob,
          }
      );
      print(response.data);
    }on DioException catch(e){
      return e.response!.data['message'];
    }

  }
}