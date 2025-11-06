
import 'package:e_commerceapproute/config/di/di.dart';
import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:e_commerceapproute/core/utils/app_routes.dart';
import 'package:e_commerceapproute/core/utils/flutter_toast.dart';
import 'package:e_commerceapproute/features/ui/cart_details/cubit/cart_states.dart';
import 'package:e_commerceapproute/features/ui/cart_details/cubit/cart_view_model.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/product/cubit/product_tab_states.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/product/cubit/product_tab_view_model.dart';
import 'package:e_commerceapproute/features/ui/widgets/main_error.dart';
import 'package:e_commerceapproute/features/ui/widgets/main_loading.dart';
import 'package:e_commerceapproute/features/ui/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductTab extends StatefulWidget {
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProducts();
  }
  // @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartViewModel, CartStates>(
      listener: (context, state) {
        if (state is AddCartSuccessState) {
          ToastMessage.toastMsg(
              'Added item successfully',
              AppColors.greenColor,
              AppColors.whiteColor);
        }
        else if (state is AddCartErrorState) {
          ToastMessage.toastMsg(
              state.message,
              AppColors.redColor,
              AppColors.whiteColor);
        }
      },
      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductErrorState) {
            return MainError(errorMessage: state.message);
          } else if (state is ProductSuccessState) {
            return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2.8.h,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h),
                          itemCount: state.productsList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //todo: navigate to product details screen
                                Navigator.pushNamed(
                                    context, AppRoutes.productRoute,
                                    arguments: state.productsList![index]);
                              },
                              child: ProductTabItem(
                                product: state.productsList![index],),
                            );
                          },
                        ))
                  ],
                ));
          } else {
            return const MainLoading();
          }
        },

      ),
    );
  }
}