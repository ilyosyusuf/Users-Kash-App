import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class HiveModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String gender;
  @HiveField(4)
  late String status;
}
