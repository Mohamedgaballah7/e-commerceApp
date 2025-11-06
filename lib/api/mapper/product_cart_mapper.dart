import 'package:e_commerceapproute/api/model/response/product_add_cart_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/product_add_cart.dart';

extension AddProductMapper on ProductsDto {
  AddProducts toAddProduct() {
    return AddProducts(id: id, product: product, count: count, price: price);
  }
}
