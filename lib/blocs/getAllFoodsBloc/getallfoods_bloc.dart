import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toktok/models/home_screen_models/food.dart';
import 'package:toktok/repository/api_repository.dart';

part 'getallfoods_event.dart';
part 'getallfoods_state.dart';

class GetallfoodsBloc extends Bloc<GetallfoodsEvent, GetallfoodsState> {
  ApiRepository apiRepository = ApiRepository();
  GetallfoodsBloc() : super(GetallfoodsInitial());

  @override
  Stream<GetallfoodsState> mapEventToState(
    GetallfoodsEvent event,
  ) async* {
    if (event is RequestGetAllFoods) {
      yield* getAllFoodsMapEventToState();
    }
  }

  Stream<GetallfoodsState> getAllFoodsMapEventToState() async* {
    try {
      yield GetAllFoodLoading();
      List<Food> allFoods = await apiRepository.getAllFoods();
      yield GetAllFoodsSuccess(allFoods: allFoods);
    } catch (e) {
      yield GetAllFoodsFailed(message: e.toString());
    }
  }
}
