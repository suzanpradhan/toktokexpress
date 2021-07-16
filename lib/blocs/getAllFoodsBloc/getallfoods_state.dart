part of 'getallfoods_bloc.dart';

abstract class GetallfoodsState extends Equatable {
  const GetallfoodsState();

  @override
  List<Object> get props => [];
}

class GetallfoodsInitial extends GetallfoodsState {}

class GetAllFoodLoading extends GetallfoodsState {}

class GetAllFoodsSuccess extends GetallfoodsState {
  final List<Food> allFoods;

  GetAllFoodsSuccess({required this.allFoods});
  @override
  List<Object> get props => [allFoods];
}

class GetAllFoodsFailed extends GetallfoodsState {
  final String message;
  GetAllFoodsFailed({required this.message});

  @override
  List<Object> get props => [message];
}
