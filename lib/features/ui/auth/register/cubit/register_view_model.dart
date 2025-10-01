import 'package:dio/dio.dart';
import 'package:e_commerceapproute/core/exception/app_exception.dart';
import 'package:e_commerceapproute/domain/entities/request/register_request.dart';
import 'package:e_commerceapproute/domain/use_cases/register_use_case.dart';
import 'package:e_commerceapproute/features/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterViewModel extends Cubit<AuthStates>{
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}):super(AuthInitialState());
  var formKey = GlobalKey<FormState>();
  void register({required String name,required String email,required String rePassword,required String password,required String phone})async{
    if(formKey.currentState?.validate()==true){
      try{
        emit(AuthLoadingState());
        var registerRequest=RegisterRequestDto(
            name: name,
            email: email,
            password: password,
            rePassword: rePassword,
            phone: phone);
        var response=await registerUseCase.invoke(registerRequest);
        emit(AuthSuccessState(authResponse: response));
      } on AppException catch(e){
        emit(AuthErrorState(message: e.message));
      }
      on DioException catch(e){
        final message=(e.error is AppException)?
        (e.error as AppException).message:
        'UnExpected error occurred';
        emit(AuthErrorState(message: message));
      }
    }
  }
}