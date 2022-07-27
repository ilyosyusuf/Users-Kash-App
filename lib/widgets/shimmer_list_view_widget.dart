import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:users/core/components/box_all_decoration.dart';
import 'package:users/core/components/shimmer_decoration.dart';
import 'package:users/core/constants/color_const.dart';
import 'package:users/core/extensions/context_extension.dart';

class ShimmerListTileWidget extends StatelessWidget {
  const ShimmerListTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxAllDecoration.instance.decor(color: ColorConst.kSecondaryColor),
      margin: const EdgeInsets.all(20),
      width: context.width,
      child: ListTile(
        leading: ShimmerDecoration.instance.shimmer(
          child: const CircleAvatar(
            radius: 25,
          ),
        ),
        title: ShimmerDecoration.instance.shimmer(
            child: Container(
          color: ColorConst.kGreyColor,
          height: context.height * 0.01,
        )),
        subtitle: ShimmerDecoration.instance.shimmer(
            child: Container(
          color: ColorConst.kGreyColor,
          height: context.height * 0.01,
        )),
      ),
    );
  }
}
