
import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:e_commerceapproute/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


typedef OnValidator = String? Function(String?)?;
class CustomTextFormField extends StatelessWidget {
  Color colorBorderSide;
  Color? cursorColor;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;
  OnValidator? validator;
  TextInputType? keyboardType;
  bool obscureText ;
  int? maxLines;
  TextStyle? style;
  Color? filledColor;
  CustomTextFormField({super.key,
     this.colorBorderSide = AppColors.transparentColor,
     this.cursorColor=AppColors.primaryColor,
     this.hintText,
     this.hintStyle,
     this.labelText,
     this.labelStyle,
     this.prefixIcon,
     this.suffixIcon,
     required this.controller,
     this.validator,
     this.keyboardType = TextInputType.text,
     this.obscureText = false,
     this.maxLines,
     this.style,
    this.filledColor = AppColors.whiteColor
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor,
        enabledBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
        focusedBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
        errorBorder: builtDecorationBorder(colorBorderSide: AppColors.redColor),
        focusedErrorBorder: builtDecorationBorder(colorBorderSide: AppColors.redColor),
        hintText: hintText,
        hintStyle: hintStyle?? AppStyles.light18HintText,
        labelText: labelText,
        labelStyle: labelStyle?? AppStyles.light18HintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: AppStyles.light18HintText.copyWith(color: AppColors.redColor),
      ),
      cursorColor: cursorColor,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines ?? 1,
      style: style,
    );
  }
  OutlineInputBorder builtDecorationBorder({required Color colorBorderSide}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: colorBorderSide,
        width: 1,
      ),
    );
  }
}
