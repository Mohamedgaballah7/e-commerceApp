import 'package:e_commerceapproute/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MainError  extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onTryAgain;
  const MainError ({super.key,required this.errorMessage,this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(errorMessage,style: AppStyles.medium14LightPrimary,)),
        onTryAgain!=null?
        ElevatedButton(onPressed: onTryAgain, child: Text('Try Again',style: AppStyles.semi20Primary,)):
            Container(),
      ],
    );
  }
}
