import 'package:e_commerceapproute/domain/entities/request/login_request.dart';
import 'package:e_commerceapproute/domain/entities/response/auth_response.dart';
import 'package:e_commerceapproute/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  // todo: constructor injection
  LoginUseCase({required this.authRepository});
  Future<AuthResponseDto> invoke(LoginRequestDto loginRequest){
    return authRepository.login(loginRequest);
  }
}