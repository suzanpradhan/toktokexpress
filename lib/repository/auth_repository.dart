import 'package:dio/dio.dart';
import 'package:toktok/models/home_screen_models/user.dart';
import 'dart:convert' as convert;
import 'package:toktok/utils/constants/api_constant.dart';

class AuthRepository {
  late Response response;
  var dio = Dio();

  Future<User> login({required User userModel}) async {
    try {
      print(userModel.toDbForLogin());
      print(ApiConstant.loginUrl);
      var formData = FormData.fromMap(userModel.toDbForLogin());
      response = await dio.post(ApiConstant.loginUrl, data: formData);
      final decodedData = convert.jsonDecode(response.data);
      print(decodedData);
      if (decodedData['status'] == "success") {
        User user = User.fromDbtoModel(decodedData);
        return user;
      } else {
        return Future.error("Login Failed1.");
      }
    } on DioError catch (e) {
      return Future.error("Login Failed2.");
    } catch (e) {
      return Future.error("Login Failed3.");
    }
  }
}
