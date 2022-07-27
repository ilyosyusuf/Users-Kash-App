import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:users/core/boxes/boxes.dart';
import 'package:users/models/usermodel/user_model.dart';

class HiveService {
  static final HiveService _instance = HiveService._init();
  static HiveService get instance => _instance;
  HiveService._init();

  Future openBox()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    await Hive.openBox<UserModel>('users');
  }

  Future addUser(List<UserModel> data)async{
    await Boxes.instance.getUserBox().addAll(data);
  }

  Future deleteData(UserModel data) async {
    data.delete();
  }
}
