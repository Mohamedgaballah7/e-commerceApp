import 'package:e_commerceapproute/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/request/login_request.dart';
import 'package:e_commerceapproute/domain/entities/request/register_request.dart';
import 'package:e_commerceapproute/domain/entities/response/auth_response.dart';
import 'package:e_commerceapproute/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) {
    return authRemoteDataSource.register(registerRequest);
  }

}