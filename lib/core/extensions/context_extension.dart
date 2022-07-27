import 'package:flutter/cupertino.dart';

extension MyContext on BuildContext{
  MediaQueryData get mediaQueryData => MediaQuery.of(this);
  double get height => mediaQueryData.size.height;
  double get width => mediaQueryData.size.width;
}