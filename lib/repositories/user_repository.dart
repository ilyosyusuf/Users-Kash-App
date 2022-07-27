import 'package:dio/dio.dart';
import 'package:users/core/constants/url_const.dart';
import 'package:users/models/usermodel/user_model.dart';

class UserRepository{
  Future<List<UserModel>> getUsers() async{
    Response res = await Dio().get(UrlConst.baseUrl);
    print("request ketdi");
    // print(res.data == res.data);
    return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
  }
}