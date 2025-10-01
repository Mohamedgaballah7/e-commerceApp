
import 'package:e_commerceapproute/domain/entities/response/category.dart';

abstract class HomeStates {}
class CategoryInitialState extends HomeStates{}
class CategoryErrorState extends HomeStates{
  String message;
  CategoryErrorState({required this.message});
}
class CategorySuccessState extends HomeStates{
  List<Category>? categoriesList;
  CategorySuccessState({required this.categoriesList});
}
class CategoryLoadingState extends HomeStates{}
class BrandInitialState extends HomeStates{}
class BrandErrorState extends HomeStates{
  String message;
  BrandErrorState({required this.message});
}
class BrandSuccessState extends HomeStates{
  List<Category>? brandsList;
  BrandSuccessState({required this.brandsList});
}
class BrandLoadingState extends HomeStates{}