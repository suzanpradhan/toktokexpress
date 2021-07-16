import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toktok/models/home_screen_models/category.dart';
import 'package:toktok/repository/api_repository.dart';

part 'getallcategories_event.dart';
part 'getallcategories_state.dart';

class GetallcategoriesBloc
    extends Bloc<GetallcategoriesEvent, GetallcategoriesState> {
  ApiRepository _apiRepository = ApiRepository();
  GetallcategoriesBloc() : super(GetallcategoriesInitial());

  @override
  Stream<GetallcategoriesState> mapEventToState(
    GetallcategoriesEvent event,
  ) async* {
    if (event is RequestGetAllCategories) {
      yield* getAllCategoriesMapEventToState();
    }
  }

  Stream<GetallcategoriesState> getAllCategoriesMapEventToState() async* {
    try {
      yield GetAllCategoriesLoading();
      List<Category> allCategoriesList =
          await _apiRepository.getAllCategories();
      yield GetAllCategoriesLoadSuccess(allCategoriesList: allCategoriesList);
    } catch (e) {
      yield GetAllCategoriesLoadFailed(message: e.toString());
    }
  }
}
