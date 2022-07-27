import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:users/core/constants/color_const.dart';

class ShimmerDecoration {
  static final ShimmerDecoration _instance = ShimmerDecoration._init();
  static ShimmerDecoration get instance => _instance;
  ShimmerDecoration._init();

  shimmer({required Widget child}) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: 450),
        baseColor: ColorConst.kGreyColor,
        highlightColor: ColorConst.kWhiteColor,
        child: child);
  }
}
