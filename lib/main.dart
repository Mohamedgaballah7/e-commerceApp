import 'package:e_commerceapproute/core/utils/app_routes.dart';
import 'package:e_commerceapproute/core/utils/app_theme.dart';
import 'package:e_commerceapproute/core/utils/shared_prefs_utils.dart';
import 'package:e_commerceapproute/features/ui/auth/login/login_screen.dart';
import 'package:e_commerceapproute/features/ui/auth/register/register_screen.dart';
import 'package:e_commerceapproute/features/ui/cart_details/cart_screen.dart';
import 'package:e_commerceapproute/features/ui/cart_details/cubit/cart_view_model.dart';
import 'package:e_commerceapproute/features/ui/home/home_screen.dart';
import 'package:e_commerceapproute/features/ui/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/di/di.dart';
import 'config/my_bloc_observer.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsUtils.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPrefsUtils.init();
  String routeName ;
  var token = SharedPrefsUtils.getData(key: 'token');
  if(token == null){
    //todo: no user , no token => login
    routeName = AppRoutes.loginRoute ;
  }else{
    //todo: user => token => home screen
    routeName = AppRoutes.homeRoute ;
  }
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<CartViewModel>())],
      child: MyApp(routeName: routeName),
    ),
  );
}

class MyApp extends StatelessWidget
{
  String routeName;
  MyApp({required this.routeName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
            AppRoutes.loginRoute:(context)=>LoginScreen(),
            AppRoutes.registerRoute:(context)=>RegisterScreen(),
            AppRoutes.homeRoute:(context)=>Homescreen(),
            AppRoutes.productRoute:(context)=>ProductDetails(),
            AppRoutes.cartRoute: (context) => CartScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }

}
