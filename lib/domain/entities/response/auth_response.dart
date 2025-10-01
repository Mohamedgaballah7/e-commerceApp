
import 'package:e_commerceapproute/domain/entities/response/user_response.dart';

class AuthResponseDto{
  UserResponseDto? userResponseDto;
  String?token;
  AuthResponseDto({required this.userResponseDto,required this.token});
}