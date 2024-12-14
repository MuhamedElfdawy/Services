import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/auth/splash/view.dart';
import 'package:my_services/core/logic/helper_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
        theme: ThemeData(
          fontFamily: 'Cairo',
          primarySwatch: getMyMaterialColor(),
          primaryColor: getMyMaterialColor(),
          hintColor:  Color(0xff999999),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: getMyMaterialColor()),
            ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: getMyMaterialColor())
              ),
              filled: true,
              fillColor: Colors.white,
          ),
        ),
        home: child,
      ),
      child: Splash(),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

getMyMaterialColor() {
  Color color = const Color(0xffECB73E);
  return MaterialColor(color.value,
      {
        50: color.withOpacity(0.1),
        100: color.withOpacity(0.2),
        200: color.withOpacity(0.3),
        300: color.withOpacity(0.4),
        400: color.withOpacity(0.5),
        500: color.withOpacity(0.6),
        600: color.withOpacity(0.7),
        700: color.withOpacity(0.8),
        800: color.withOpacity(0.9),
        900: color,
      });
}