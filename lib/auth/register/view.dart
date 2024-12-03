import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/login/view.dart';
import 'package:my_services/core/design/app_Button.dart';
import 'package:my_services/core/design/app_input.dart';
import 'package:my_services/core/design/app_text.dart';
import 'package:my_services/core/logic/dio_helper.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:my_services/main.dart';
import 'package:my_services/sheets/cities.dart';
import 'package:my_services/sheets/governorate.dart';

class Register extends StatefulWidget {
  final bool isFactor;
  const Register({super.key, required this.isFactor,});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  TextEditingController? factorJobController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedGovernorat;
  String? selectedCity;

  void register() async{
    final response = await DioHelper().sendData(widget.isFactor?'FactorRegistration':'CustomerRegistration', data: {
    "firstName": firstNameController.text,
    "lastName": lastNameController.text,
    "goverID": 1,
    "cityID": 1,
    "jobId": 1,
    "userType": widget.isFactor? 'Factor' : 'Customer',
    "phoneNumber": phoneController.text,
    "email": emailController.text,
    "password":  passwordController.text,
    "confirmPassword": confirmPasswordController.text,
    });
    if(response!.isSuccess){
      ShowMessages(message: 'تم إنشاء الحساب',style: TextStyle(fontSize: 18,color: Colors.green));
      navigateTo(Login());
    }else{
      ShowMessages(message: 'من فضلك راجع البيانات',style: TextStyle(fontSize: 18,color: Colors.red));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.only(right: 20, left: 20),
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
                        height: 7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: IconButton(onPressed: (){
                              navigateTo(Login());
                            }, icon: Icon(Icons.navigate_before,size: 35.sp,)),
                          ),
                          SizedBox(width: 80.w,),
                          Center(
                            child: Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: getMyMaterialColor()),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: 'الاسم الاول'),
                      SizedBox(
                        height: 10.h,
                      ),
                        AppInput(
                         controller: firstNameController,
                            hintText: 'مثال : محمد',
                           validate: (value) {
                             if(value.isEmpty){
                               return'ادخل الاسم الاول';
                             }
                             return null;
                           },

                       ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'الاسم الاخير'),
                      SizedBox(
                        height: 10.h,
                      ),
                        AppInput(
                         controller: lastNameController,
                           hintText: 'مثال : جمال',
                          validate: (value) {
                            if(value.isEmpty){
                              return'ادخل الاسم الاخير';
                            }
                            return null;
                          },
                       ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'المحافظة'),
                      SizedBox(
                        height: 10.h,
                      ),
                        StatefulBuilder(
                            builder: (context, setState) => GestureDetector(
                              onTap:() async{
                                selectedGovernorat = await showModalBottomSheet(context: context, builder: (context) => Container(
                                  color: Colors.white,
                                  child: GoverSheet(),
                                ),);
                                setState(() {});
                              },
                              child: AppInput(
                                isEnabled: false,
                                hintText: selectedGovernorat??'مثال : الدقهلية',
                                hintColor: Colors.black,
                                // validate: (selectedGovernorat) {
                                //   if(selectedGovernorat.isEmpty){
                                //     return'ادخل المحافظة';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'المدينة'),
                      SizedBox(
                        height: 10.h,
                      ),
                        StatefulBuilder(builder: (context, setState) => GestureDetector(
                          onTap: () async{
                            selectedCity = await showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                color: Colors.white,
                                child: CitiesSheet(),
                              ),
                            );
                            setState(() {});
                          },
                          child: AppInput(
                            isEnabled: false,
                            hintText: selectedCity??'مثال : المنصورة',
                            hintColor: Colors.black,
                            // validate: (selectedCity) {
                            //   if(selectedCity.isEmpty){
                            //     return'ادخل المدينة';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),),
                      SizedBox(
                        height: 16.h,
                      ),
                         widget.isFactor?
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 AppText(text: 'المهنة'),
                                 SizedBox(
                                   height: 10.h,
                                 ),
                                 AppInput(
                                   controller: factorJobController,
                                   hintText: 'مثال : سباك',
                                   validate: (value) {
                                     if(value.isEmpty){
                                       return'ادخل المهنة';
                                     }
                                     return null;
                                   },
                                 ),
                               ],
                             ):SizedBox(),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'البريد الالكتروني'),
                      SizedBox(
                        height: 10.h,
                      ),
                        AppInput(
                         controller: emailController,
                           hintText: 'مثال : mo@gmail.com',
                          validate: (value) {
                            if(value.isEmpty){
                              return'ادخل البريد الالكتروني';
                            }else if(value.contains('@')){
                              return null ;
                            }
                            return 'ادخل البريد الالكتروني صحيح';
                          },
                       ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'رقم التليفون'),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppInput(
                          controller: phoneController,
                          hintText: 'مثال : 01000000',
                        validate: (value) {
                          if(value.isEmpty){
                            return'ادخل رقم التليفون';
                          }else if(value.length != 11){
                            return 'يجب ان يكون رقم التليفون 11 رقم';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'كلمة المرور'),
                      SizedBox(
                        height: 10.h,
                      ),
                        AppInput(
                         controller: passwordController,
                        hintText: '********',
                        isPassword: true,
                           validate: (value) {
                             if(value.isEmpty){
                               return'ادخل كلمة المرور';
                             }
                             return null;
                           },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppText(text: 'تأكيد كلمة المرور'),
                      SizedBox(
                        height: 10.h,
                      ),
                        AppInput(
                         controller: confirmPasswordController,
                        hintText: '********',
                        isPassword: true,
                           validate: (value) {
                             if(value.isEmpty){
                               return'ادخل تأكيد كلمة المرور';
                             }
                             return null;
                           },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppButton(onPressed: () async {
                        if(formKey.currentState!.validate()){
                         register();
                        }
                      },
                        text: 'انشاء', bottomPadding: 10, topPadding: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('انا امتلك حساب',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal),),
                          TextButton(onPressed: (){
                            navigateTo(Login());
                          }, child: AppText(text: 'تسجيل الدخول')
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}