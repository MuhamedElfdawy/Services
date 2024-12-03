import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';

class AppInput extends StatefulWidget {
  final String hintText;
  final bool isPassword,isSuffixIcon;
  final TextEditingController? controller ;

    const AppInput({
    super.key,
    this.hintText = '',
    this.isPassword = false,
    this.isSuffixIcon = false,
    required this.controller,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {

  bool isPasshidden = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        controller: widget.controller,
        obscureText: isPasshidden && widget.isPassword,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            borderSide: BorderSide(color: getMyMaterialColor()),
          ),
          prefixIcon: widget.isPassword
              ? IconButton(
              onPressed: () {
                isPasshidden = !isPasshidden ;
                setState(() {});
              },
              icon: Icon(isPasshidden ? Icons.visibility_off : Icons.visibility))
              : null,
          suffixIcon: widget.isSuffixIcon
              ? IconButton(
              onPressed: () {}, icon: const Icon(Icons.calendar_month_outlined))
              : null,
        ),
      ),
    );
  }
}
