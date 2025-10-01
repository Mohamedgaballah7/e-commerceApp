
import 'package:e_commerceapproute/domain/entities/response/product_response.dart';

sealed class ProductTabStates{}
class ProductTabInitialState extends ProductTabStates{}
class ProductLoadingState extends ProductTabStates{}
class ProductErrorState extends ProductTabStates{
  String message ;
  ProductErrorState({required this.message});
}
class ProductSuccessState extends ProductTabStates{
  List<Product>? productsList ;
  ProductSuccessState({required this.productsList});
}