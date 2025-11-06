import 'package:e_commerceapproute/api/mapper/get_products_mapper.dart';
import 'package:e_commerceapproute/api/model/response/get_cart_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/get_cart.dart';

extension GetCartMapper on GetCartDto {
  GetCart toGetCart() {
    return GetCart(
      id: id,
      cartOwner: cartOwner,
      totalCartPrice: totalCartPrice,
      v: v,
      products:
          products
              ?.map((getProductDto) => getProductDto.toGetProducts())
              .toList() ??
          [],
    );
  }
}
