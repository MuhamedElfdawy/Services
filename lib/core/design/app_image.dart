import 'dart:io';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height,width;
  final BoxFit fit;
  const AppImage(
      {Key? key,
        required this.path,
        required this.fit,
        this.height,
        this.width,
      });

  @override
  Widget build(BuildContext context) {
    if(path.contains('assets')){
      return Image.asset(
        path,
        fit: fit,
        height: height,
        width: width,
      );
    }else {
      return Image.file(
        File(path),
        fit: fit,
        height: height,
        width: width,
      );
    }
  }
}
