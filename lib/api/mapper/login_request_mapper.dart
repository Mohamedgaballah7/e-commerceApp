import 'package:e_commerceapproute/api/model/request/login_request_dto.dart';
import 'package:e_commerceapproute/domain/entities/request/login_request.dart';

extension LoginRequestMapper on LoginRequestDto{
  LoginRequest toLoginRequest(){
    return LoginRequest(
      email: email,
      password:password
    );
  }
}