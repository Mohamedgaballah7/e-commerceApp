import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerceapproute/config/di/di.dart';
import 'package:e_commerceapproute/core/utils/app_assets.dart';
import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:e_commerceapproute/core/utils/app_routes.dart';
import 'package:e_commerceapproute/core/utils/app_styles.dart';
import 'package:e_commerceapproute/core/utils/dialog_utils.dart';
import 'package:e_commerceapproute/core/utils/shared_prefs_utils.dart';
import 'package:e_commerceapproute/core/utils/validators.dart';
import 'package:e_commerceapproute/features/ui/auth/auth_states.dart';
import 'package:e_commerceapproute/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerceapproute/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerceapproute/features/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController =
      TextEditingController(text: "adasdfvv@fds.com");
  TextEditingController passwordController =
      TextEditingController(text: "18061717@A");


  LoginViewModel viewModel=getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,AuthStates>(
      bloc: viewModel,
        listener: (context, state) {
          if(state is AuthLoadingState){
            DialogUtils.showLoading(context: context, message: 'Waiting');
          }
          else if(state is AuthSuccessState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: 'Login Successfully',
              title: 'Success',
              posActionName: 'ok',
              posAction: (){
              SharedPrefsUtils.saveData(key: 'token', value: state.authResponse.token);
                Navigator.pushReplacementNamed(
                    context, AppRoutes.homeRoute);
              }
            );
          }
          else if(state is AuthErrorState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: state.message,
              title: 'Failed',
              posActionName: 'ok',
            );
          }
        },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    AppAssets.appBarLeading,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Welcome Back To Route',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "User Name",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  hintText: "enter your name",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: userNameController,
                                  validator: AppValidators.validateEmail),
                              Text(
                                "Password",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                hintText: "enter your password",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: passwordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: AppStyles.regular18White,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.whiteColor,
                                    textStyle: AppStyles.semi20Primary,
                                    text: "Login",
                                    onPressed: () {
                                      viewModel.login(
                                          userNameController.text,passwordController.text
                                      );


                                    }),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.registerRoute);
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Don’t have an account? Create Account',
                                            style: AppStyles.medium18White,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
      
  }
}