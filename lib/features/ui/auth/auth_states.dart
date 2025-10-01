import 'package:e_commerceapproute/domain/entities/response/auth_response.dart';

abstract class AuthStates {}
class AuthInitialState extends AuthStates{}
class AuthErrorState extends AuthStates{
  String message;
  AuthErrorState({required this.message});
}
class AuthSuccessState extends AuthStates{
  AuthResponseDto authResponse;
  AuthSuccessState({required this.authResponse});
}
class AuthLoadingState extends AuthStates{}