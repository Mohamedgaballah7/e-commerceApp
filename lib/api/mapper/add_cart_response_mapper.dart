import 'package:e_commerceapproute/api/mapper/add_cart_mapper.dart';
import 'package:e_commerceapproute/api/model/response/add_cart_response_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/add_cart_response.dart';

extension AddCartResponseMapper on AddCartResponseDto {
  AddCartResponse toAddCartResponse() {
    return AddCartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      data: data!.toAddCart(),
      cartId: cartId,
      message: message,
    );
  }
}
