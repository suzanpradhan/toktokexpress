part of 'getallcategories_bloc.dart';

abstract class GetallcategoriesEvent extends Equatable {
  const GetallcategoriesEvent();

  @override
  List<Object> get props => [];
}

class RequestGetAllCategories extends GetallcategoriesEvent {}
