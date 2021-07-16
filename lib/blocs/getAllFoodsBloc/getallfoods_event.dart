part of 'getallfoods_bloc.dart';

abstract class GetallfoodsEvent extends Equatable {
  const GetallfoodsEvent();

  @override
  List<Object> get props => [];
}

class RequestGetAllFoods extends GetallfoodsEvent {}
