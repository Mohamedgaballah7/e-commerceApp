import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainLoading  extends StatelessWidget {
  const MainLoading ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
