import 'package:e_commerceapproute/api/mapper/product_cart_mapper.dart';
import 'package:e_commerceapproute/api/model/response/cart_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/cart.dart';

extension AddCartMapper on CartDto {
  AddCart toAddCart() {
    return AddCart(
      id: id,
      products:
          products
              ?.map((addProductDto) => addProductDto.toAddProduct())
              .toList() ??
          [],
      v: v,
      totalCartPrice: totalCartPrice,
      cartOwner: cartOwner,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
