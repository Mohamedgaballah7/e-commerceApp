import 'package:e_commerceapproute/api/mapper/get_cart_mapper.dart';
import 'package:e_commerceapproute/api/model/response/get_cart_response_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto {
  GetCartResponse toGetCartResponse() {
    return GetCartResponse(
      cartId: cartId,
      data: data!.toGetCart(),
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}
