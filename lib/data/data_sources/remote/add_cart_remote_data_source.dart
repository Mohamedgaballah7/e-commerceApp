import 'package:e_commerceapproute/domain/entities/response/add_cart_response.dart';
import 'package:e_commerceapproute/domain/entities/response/get_cart_response.dart';

abstract class AddCartRemoteDataSource {
  Future<AddCartResponse> addCart(String productId);

  Future<GetCartResponse> getItemsCart();
}
