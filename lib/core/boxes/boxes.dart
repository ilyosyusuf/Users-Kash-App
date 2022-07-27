import 'package:hive_flutter/hive_flutter.dart';
import 'package:users/models/usermodel/user_model.dart';

class Boxes {
  static final Boxes _instance = Boxes._init();
  static Boxes get instance => _instance;
  Boxes._init();
    Box<UserModel> getUserBox() =>
      Hive.box<UserModel>('users');
}