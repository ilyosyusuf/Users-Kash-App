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

  Future putData(List<UserModel> data) async {
    for (var i = 0; i < data.length; i++) {
       final box = HiveModel()
      ..id = data[i].id
      ..name = data[i].name
      ..email = data[i].email
      ..gender = data[i].gender
      ..status = data[i].status;
    Boxes.instance.getHiveBox().add(box);  
    print(box.name);
    }

  }

  Future deleteData(HiveModel data) async {
    data.delete();
  }
}
