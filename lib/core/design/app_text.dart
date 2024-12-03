import 'package:flutter/cupertino.dart';
import 'package:my_services/main.dart';

class AppText extends StatefulWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  const AppText({super.key, required this.text, this.size, this.weight, this.color});

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: getMyMaterialColor(),
      ),
    );
  }
}
