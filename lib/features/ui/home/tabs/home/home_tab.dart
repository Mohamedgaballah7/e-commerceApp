import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerceapproute/config/di/di.dart';
import 'package:e_commerceapproute/core/utils/app_assets.dart';
import 'package:e_commerceapproute/core/utils/app_colors.dart';
import 'package:e_commerceapproute/core/utils/app_styles.dart';
import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/home/cubit/home_states.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/home/cubit/home_view_model.dart';
import 'package:e_commerceapproute/features/ui/widgets/main_error.dart';
import 'package:e_commerceapproute/features/ui/widgets/main_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel=getIt<HomeViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
              _imageSlideshow(),
              _builtLineCategoryAndBrand(nameItem:'Category'),
              BlocBuilder<HomeViewModel,HomeStates>(
                bloc: viewModel,
                buildWhen: (previous, current) {
                  return current is CategorySuccessState ||
                      current is CategoryErrorState ||
                      current is CategoryLoadingState;
                },
                builder: (context, state) {
                  if(state is CategorySuccessState){
                    return _builtCategoryAndBrand(state.categoriesList??[]);
                  }
                  else if (state is CategoryErrorState){
                    return MainError(errorMessage: state.message);
                  }
                  else {
                    return MainLoading();
                  }
                },
              ),
              _builtLineCategoryAndBrand(nameItem:'Brands'),
              BlocBuilder<HomeViewModel,HomeStates>(
                buildWhen: (previous, current) {
                  return current is BrandSuccessState ||
                      current is BrandErrorState ||
                      current is BrandLoadingState;
                },
                bloc: viewModel,

                builder: (context, state) {
                  if(state is BrandSuccessState){
                    return _builtCategoryAndBrand(state.brandsList??[]);
                  }
                  else if (state is BrandErrorState){
                    return MainError(errorMessage: state.message);
                  }
                  else {
                    return MainLoading();
                  }
                },
              ),

              //_builtCategoryAndBrand()
            ],
          ),
        )

      );
  }
  /* */
Widget _builtLineCategoryAndBrand({
  required String nameItem,
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(nameItem,style: AppStyles.semi20Primary,),
      TextButton(
        onPressed: (){},
        child: Text('View all',style: AppStyles.medium14LightPrimary,),
      ),
    ],
  );
}
  Widget _builtCategoryAndBrand(List<Category>categoriesList){
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: GridView.builder(
        itemCount: categoriesList.length,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.h,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                flex: 8,
                child: CachedNetworkImage(
                  imageUrl:categoriesList[index].image??'',
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      backgroundImage: imageProvider,
                      radius: 40.w,
                    );
                  },
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Expanded(
                flex: 4,
                  child: Text(categoriesList[index].name??'',style: AppStyles.medium14Category,)),
            ],
          );
        },
      ),
    );
  }

  ImageSlideshow _imageSlideshow(){
    return ImageSlideshow(
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorRadius: 5,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 180.h,
      indicatorPadding: 8.w,
      indicatorColor: AppColors.primaryColor,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15.w),
            child: Image.asset(
              AppAssets.announcement1,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15.w),
            child: Image.asset(
              AppAssets.announcement2,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15.w),
            child: Image.asset(
              AppAssets.announcement3,
              fit: BoxFit.cover,
            ),
          ),
        ]
    );
  }
}
