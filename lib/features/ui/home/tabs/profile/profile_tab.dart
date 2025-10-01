import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:e_commerceapproute/core/utils/app_routes.dart';
import 'package:e_commerceapproute/core/utils/app_styles.dart';
import 'package:e_commerceapproute/core/utils/shared_prefs_utils.dart';
import 'package:e_commerceapproute/features/ui/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  TextEditingController fullNameController = TextEditingController(text: "Mohamed Mohamed Nabil");
  TextEditingController emailController = TextEditingController(text: "mohamed.N@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "**********");
  TextEditingController mobileController = TextEditingController(text: "01122118855");
  TextEditingController addressController = TextEditingController(text: "6th October, street 11.....");
  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool mobileReadOnly = true;
  bool addressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Welcome, Mohamed",
                  style: AppStyles.medium18Header,
                ),
                IconButton(onPressed: (){
                  //todo: remove token
                  SharedPrefsUtils.removeData(key: 'token');
                  //todo: navigate to login
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginRoute,
                        (route) => false,);
                },
                    icon: Icon(Icons.logout))
              ],
            ),
            AutoSizeText(
              "mohamed.N@gmail.com",
              style: AppStyles.medium14LightPrimary,
            ),
            SizedBox(height: 40.h,),
            AutoSizeText(
              "Your full name",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              labelStyle: AppStyles.medium14PrimaryDark,
            hintStyle: AppStyles.medium14PrimaryDark,
            colorBorderSide: AppColors.primary30Opacity,
              keyboardType: TextInputType.name,
              controller: fullNameController,
              suffixIcon: IconButton(onPressed: () {
                fullNameReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
            ),
            AutoSizeText(
              "Your E-mail",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              labelStyle: AppStyles.medium14PrimaryDark,
              hintStyle: AppStyles.medium14PrimaryDark,
              colorBorderSide: AppColors.primary30Opacity,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              suffixIcon: IconButton(onPressed: () {
                emailReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
            ),
            AutoSizeText(
              "Your password",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              obscureText: true,
              labelStyle: AppStyles.medium14PrimaryDark,
              hintStyle: AppStyles.medium14PrimaryDark,
              colorBorderSide: AppColors.primary30Opacity,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              suffixIcon: IconButton(onPressed: () {
                passwordReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
            ),
            AutoSizeText(
              "Your mobile number",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              labelStyle: AppStyles.medium14PrimaryDark,
              hintStyle: AppStyles.medium14PrimaryDark,
              colorBorderSide: AppColors.primary30Opacity,
              keyboardType: TextInputType.phone,
              controller: mobileController,
              suffixIcon: IconButton(onPressed: () {
                mobileReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
            ),
            AutoSizeText(
              "Your Address",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              labelStyle: AppStyles.medium14PrimaryDark,
              hintStyle: AppStyles.medium14PrimaryDark,
              colorBorderSide: AppColors.primary30Opacity,
              keyboardType: TextInputType.streetAddress,
              controller: addressController,
              suffixIcon: IconButton(onPressed: () {
                addressReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
            ),
          ],
        ),
      ),
    );
  }
}