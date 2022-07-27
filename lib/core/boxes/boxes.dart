import 'package:hive_flutter/hive_flutter.dart';
import 'package:users/models/hivemodel/hive_model.dart';

class Boxes {
  static final Boxes _instance = Boxes._init();
  static Boxes get instance => _instance;
  Boxes._init();

  Box<HiveModel> getHiveBox() =>
      Hive.box<HiveModel>('hiveBox');
}