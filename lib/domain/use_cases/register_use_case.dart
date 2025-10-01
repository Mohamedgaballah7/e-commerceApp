import 'package:e_commerceapproute/domain/entities/request/register_request.dart';
import 'package:e_commerceapproute/domain/entities/response/auth_response.dart';
import 'package:e_commerceapproute/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  // todo: constructor injection
  RegisterUseCase({required this.authRepository});
  Future<AuthResponseDto> invoke(RegisterRequestDto registerRequest){
    return authRepository.register(registerRequest);
  }
}