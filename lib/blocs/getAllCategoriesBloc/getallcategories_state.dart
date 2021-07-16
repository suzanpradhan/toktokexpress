part of 'getallcategories_bloc.dart';

abstract class GetallcategoriesState extends Equatable {
  const GetallcategoriesState();

  @override
  List<Object> get props => [];
}

class GetallcategoriesInitial extends GetallcategoriesState {}

class GetAllCategoriesLoading extends GetallcategoriesState {}

class GetAllCategoriesLoadSuccess extends GetallcategoriesState {
  final List<Category> allCategoriesList;
  GetAllCategoriesLoadSuccess({required this.allCategoriesList});

  @override
  List<Object> get props => [allCategoriesList];
}

class GetAllCategoriesLoadFailed extends GetallcategoriesState {
  final String message;
  GetAllCategoriesLoadFailed({required this.message});
  @override
  List<Object> get props => [message];
}
