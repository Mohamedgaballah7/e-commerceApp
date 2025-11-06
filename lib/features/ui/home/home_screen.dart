import 'package:e_commerceapproute/config/di/di.dart';
import 'package:e_commerceapproute/core/utils/app_assets.dart';
import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:e_commerceapproute/core/utils/app_styles.dart';
import 'package:e_commerceapproute/features/ui/cart_details/cubit/cart_view_model.dart';
import 'package:e_commerceapproute/features/ui/home/cubit/home_screen_states.dart';
import 'package:e_commerceapproute/features/ui/home/cubit/home_screen_view_model.dart';
import 'package:e_commerceapproute/features/ui/widgets/custom_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
HomeScreenViewModel viewModel=getIt<HomeScreenViewModel>();

@override
void initState() {
  CartViewModel.get(context).getItemsCart();
}
  @override
  Widget build(BuildContext context) {

    return
      BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(viewModel.selectedIndex),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              child: viewModel.tabs[viewModel.selectedIndex],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: viewModel.selectedIndex,
                onTap: (index) {
                  setState(() {
                    viewModel.selectedIndex = index;
                  });
                },
                items: [

                  buildBottomNavigationBarItem(
                      index: 0,
                      selectedIconName: AppAssets.selectedHomeIcon,
                      unSelectedIconName: AppAssets.unSelectedHomeIcon,
                      name: 'home'
                  ),
                  buildBottomNavigationBarItem(
                      index: 1,
                      selectedIconName: AppAssets.selectedCategoryIcon,
                      unSelectedIconName: AppAssets.unSelectedCategoryIcon,
                      name: 'favourite'

                  ),
                  buildBottomNavigationBarItem(
                      index: 2,
                      selectedIconName: AppAssets.selectedFavouriteIcon,
                      unSelectedIconName: AppAssets.unSelectedFavouriteIcon,
                      name: 'product'
                  ),
                  buildBottomNavigationBarItem(
                      index: 3,
                      selectedIconName: AppAssets.selectedAccountIcon,
                      unSelectedIconName: AppAssets.unSelectedAccountIcon,
                      name: 'profile'
                  ),
                ],
              ),
            ),
          );
        },
      );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required int index,
    required String name,
    required String selectedIconName,
    required String unSelectedIconName,
  }) {
    return BottomNavigationBarItem(
      activeIcon: CircleAvatar(
        child: Image.asset(selectedIconName),
      ),

      icon: ImageIcon(AssetImage(
        viewModel.selectedIndex == index ? selectedIconName : unSelectedIconName,
      )
      ),
      label: name,

    );
  }
OutlineInputBorder _buildCustomBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50.r));
}
PreferredSizeWidget _buildAppBar(int index) {
  return AppBar(
    surfaceTintColor: AppColors.transparentColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
    leadingWidth: double.infinity,
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Image.asset(
              AppAssets.routeLogo,
              width: 66.w,
              height: 22.h,
            ),
          ),
          Visibility(
            visible: index != 3,
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        style: AppStyles.regular14Text,
                        cursorColor: AppColors.primaryColor,
                        onTap: () {
                          //todo: implement search logic
                        },
                        decoration: InputDecoration(
                            border: _buildCustomBorder(),
                            enabledBorder: _buildCustomBorder(),
                            focusedBorder: _buildCustomBorder(),
                            contentPadding: EdgeInsets.all(16.h),
                            hintStyle: AppStyles.light14SearchHint,
                            hintText: "what do you search for?",
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30.sp,
                              color: AppColors.primaryColor.withOpacity(0.75),
                            ))),
                  ),
                  const CustomAppBarBadge(count: 5)
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
}