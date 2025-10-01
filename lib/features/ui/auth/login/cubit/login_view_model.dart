import 'package:dio/dio.dart';
import 'package:e_commerceapproute/core/exception/app_exception.dart';
import 'package:e_commerceapproute/domain/entities/request/login_request.dart';
import 'package:e_commerceapproute/domain/use_cases/login_use_case.dart';
import 'package:e_commerceapproute/features/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<AuthStates>{
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(AuthInitialState());
  var formKey = GlobalKey<FormState>();
  void login(String email,String password)async{
    if(formKey.currentState?.validate()==true){
      try{
        emit(AuthLoadingState());
        var loginRequest=LoginRequestDto(email: email, password: password);
        var response=await loginUseCase.invoke(loginRequest);
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