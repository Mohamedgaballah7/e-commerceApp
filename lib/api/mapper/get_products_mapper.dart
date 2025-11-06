import 'package:e_commerceapproute/api/mapper/product_mapper.dart';
import 'package:e_commerceapproute/api/model/response/get_products_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/get_products.dart';

extension GetProductsMapper on GetProductsDto {
  GetProducts toGetProducts() {
    return GetProducts(
      id: id,
      price: price,
      count: count,
      product: product!.toProduct(),
    );
  }
}
