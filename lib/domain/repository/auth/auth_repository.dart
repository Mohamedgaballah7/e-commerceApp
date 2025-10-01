
import 'package:e_commerceapproute/domain/entities/request/login_request.dart';
import 'package:e_commerceapproute/domain/entities/request/register_request.dart';
import 'package:e_commerceapproute/domain/entities/response/auth_response.dart';

abstract class AuthRepository{
  Future<AuthResponseDto> login(LoginRequestDto loginRequest);
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest);
}