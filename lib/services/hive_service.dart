import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:users/core/boxes/boxes.dart';
import 'package:users/models/hivemodel/hive_model.dart';
import 'package:users/models/usermodel/user_model.dart';

class HiveService {
  static final HiveService _instance = HiveService._init();
  static HiveService get instance => _instance;
  HiveService._init();

  Future openBox()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    await Hive.openBox<HiveModel>('hiveBox');
  }

  Future putData(UserModel data) async {
    final box = HiveModel()
      ..id = data.id
      ..name = data.name
      ..email = data.email
      ..gender = data.gender
      ..status = data.status;
    Boxes.instance.getHiveBox().add(box);
    print(box.name);
  }

  Future deleteData(HiveModel data) async {
    data.delete();
  }
}
