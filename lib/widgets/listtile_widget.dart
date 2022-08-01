import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:users/core/components/box_all_decoration.dart';
import 'package:users/core/extensions/context_extension.dart';

class ListTileWidget extends StatelessWidget {
  final Color itemColor;
  final Color leadingColor;
  final String userId;
  final String userName;
  final String userEmail;
  const ListTileWidget({
    Key? key,
    required this.itemColor,
    required this.leadingColor,
    required this.userId,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxAllDecoration.instance.decor(color: itemColor),
      margin: const EdgeInsets.all(20),
      width: context.width,
      child: ListTile(
        leading: CircleAvatar(
            radius: 25, backgroundColor: leadingColor, child: Text(userId)),
        title: Text(userName, overflow: TextOverflow.ellipsis),
        subtitle: Text(userEmail, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
