import 'package:e_commerceapproute/api/model/response/user_response_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/user_response.dart';

extension UserMapper on User{
  UserResponseDto toUserDto(){
    return UserResponseDto(
        email: email,
        name: name
    );
  }
}