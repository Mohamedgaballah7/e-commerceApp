import 'package:e_commerceapproute/api/mapper/user_mapper.dart';
import 'package:e_commerceapproute/api/model/response/auth_response_dto.dart';
import 'package:e_commerceapproute/core/exception/app_exception.dart';
import 'package:e_commerceapproute/domain/entities/response/auth_response.dart';

extension AuthResponseMapper on AuthResponse{
  AuthResponseDto toAuthResponseDto() {
    if (user != null  && token != null && token!.isNotEmpty) {
      return AuthResponseDto(
          userResponseDto: user!.toUserDto(),
          token: token
      );
    }
    throw ServerException(message: 'Failed Authentication');
  }
}