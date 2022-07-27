import 'dart:io';

import 'package:dio/dio.dart';
import 'package:users/core/boxes/boxes.dart';
import 'package:users/core/constants/url_const.dart';
import 'package:users/models/usermodel/user_model.dart';
import 'package:users/screens/bloc/home_state.dart';
import 'package:users/services/hive_service.dart';

class UserRepository{
  Future<List<UserModel>?> getUsers() async{
    try {
          Response res = await Dio().get(UrlConst.baseUrl);
    print("request ketdi");
    if(res.statusCode == HttpStatus.ok){
      await Boxes.instance.getUserBox().clear();
                await  HiveService.instance.addUser((res.data as List).map((e) => UserModel.fromJson(e)).toList());
        print(Boxes.instance.getUserBox().values.toList()[0].name.toString());
    return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
    } else{
      print("serverda xato bor");
    }
    } catch (e) {
      return throw Exception(e);

    }
  }
}