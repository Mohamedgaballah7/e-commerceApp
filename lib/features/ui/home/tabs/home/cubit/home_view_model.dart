import 'package:dio/dio.dart';
import 'package:e_commerceapproute/core/exception/app_exception.dart';
import 'package:e_commerceapproute/domain/use_cases/brand_use_case.dart';
import 'package:e_commerceapproute/domain/use_cases/category_use_case.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/home/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel extends Cubit<HomeStates>{
CategoryUseCase categoryUseCase;
BrandUseCase brandUseCase;

  HomeViewModel({required this.categoryUseCase,required this.brandUseCase}):super(CategoryInitialState());

  void getAllCategories()async{
      try{
        emit(CategoryLoadingState());
        var categoriesList=await categoryUseCase.invoke();
        emit(CategorySuccessState(categoriesList: categoriesList));
      } on AppException catch(e){
        emit(CategoryErrorState(message: e.message));
      }
      on DioException catch(e){
        final message=(e.error is AppException)?
        (e.error as AppException).message:
            'UnExpected error occurred';
        emit(CategoryErrorState(message: message));
      }

  }
void getAllBrands()async{
  try{
    emit(BrandLoadingState());
    var brandsList=await brandUseCase.invoke();
    emit(BrandSuccessState(brandsList: brandsList));
  } on AppException catch(e){
    emit(BrandErrorState(message: e.message));
  }
  on DioException catch(e){
    final message=(e.error is AppException)?
    (e.error as AppException).message:
    'UnExpected error occurred';
    emit(BrandErrorState(message: message));
  }

}
}