import 'package:flutter/material.dart';

class BoxAllDecoration {
  static final BoxAllDecoration _instance = BoxAllDecoration._init();
  static BoxAllDecoration get instance => _instance;
  BoxAllDecoration._init();

  static decor({Color? color, Color? borderColor = Colors.transparent}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 176, 187, 192).withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(3, 5),
          ),
        ],
      );
}
