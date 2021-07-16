import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toktok/models/home_screen_models/category.dart';
import 'package:toktok/models/home_screen_models/food.dart';
import 'package:toktok/models/home_screen_models/restaurant.dart';
import 'dart:convert' as convert;

import 'package:toktok/utils/constants/api_constant.dart';

class ApiRepository {
  late Response response;
  var dio = Dio();

  Future<List<Food>> getAllFoods() async {
    try {
      response = await dio.get(ApiConstant.getAllFoodsUrl);
      List jsonDecodedDatas = convert.jsonDecode(response.data);
      if (jsonDecodedDatas.isNotEmpty) {
        List<Food> allFoods =
            jsonDecodedDatas.map((data) => Food.fromDbtoModel(data)).toList();
        return allFoods;
      } else {
        return Future.error("No Foods available.");
      }
    } catch (e) {
      return Future.error("Cant't Load Datas.");
    }
  }

  Future<Food> getFood({required String foodID}) async {
    try {
      response = await dio.post(ApiConstant.getFood, data: {"value": foodID});
      List jsonDecodedDatas = convert.jsonDecode(response.data);
      if (jsonDecodedDatas.isEmpty) {
        Food allFoods =
            jsonDecodedDatas.map((data) => Food.fromDbtoModel(data)).first;
        return allFoods;
      } else {
        return Future.error("No Food available.");
      }
    } catch (e) {
      return Future.error("Cant't Load Food Detail.");
    }
  }

  Future<List<Category>> getAllCategories() async {
    try {
      response = await dio.get(ApiConstant.getAllCategoriesUrl);
      List jsonDecodedDatas = convert.jsonDecode(response.data);
      print(jsonDecodedDatas);
      if (jsonDecodedDatas.isNotEmpty) {
        List<Category> allCaategories = jsonDecodedDatas
            .map((data) => Category.fromDbtoModel(data))
            .toList();
        return allCaategories;
      } else {
        return Future.error("No Categories available.");
      }
    } catch (e) {
      return Future.error("Cant't Load Datas.");
    }
  }

  // Future<Restaurant> getAllRestaurants()async{
  //   try {

  //   } catch (e) {
  //   }
  // }
}
