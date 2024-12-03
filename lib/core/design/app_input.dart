import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';

class AppInput extends StatefulWidget {
  final String hintText;
  final double hintSize;
  final Color? hintColor;
  final bool isPassword,isSuffixIcon,isEnabled;
  final TextEditingController? controller ;
  final FormFieldValidator? validate;
  final TextInputType? keyBord;


    const AppInput({
    super.key,
    this.hintText = '',
    this.hintSize = 16,
    this.hintColor,
    this.isPassword = false,
    this.isSuffixIcon = false,
    this.controller,
    this.isEnabled = true,
     this.validate,
      this.keyBord,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {

  bool isPasshidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      keyboardType: widget.keyBord,
      maxLength: null,
      obscureText: isPasshidden && widget.isPassword,
      obscuringCharacter: '*',
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: widget.hintSize, fontWeight: FontWeight.normal,color: widget.hintColor),
        hintTextDirection: TextDirection.rtl,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: getMyMaterialColor())
        ),
        prefixIcon: widget.isPassword
            ? IconButton(
            onPressed: () {
              isPasshidden = !isPasshidden ;
              setState(() {});
            },
            icon: Icon(isPasshidden ? Icons.visibility_off : Icons.visibility),color: const Color(0xff35618E),)
            : null,
        suffixIcon: widget.isSuffixIcon
            ? IconButton(
            onPressed: () {}, icon: const Icon(Icons.calendar_month_outlined),color: const Color(0xff35618E))
            : null,
      ),
    );
  }
}
