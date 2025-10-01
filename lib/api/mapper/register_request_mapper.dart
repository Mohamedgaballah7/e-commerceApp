import 'package:e_commerceapproute/api/model/request/register_request_dto.dart';
import 'package:e_commerceapproute/domain/entities/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequestDto{
  RegisterRequest toRegisterRequest(){
    return RegisterRequest(
      email: email,
      name: name,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}