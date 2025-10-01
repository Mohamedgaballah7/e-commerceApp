import 'package:dio/dio.dart';
import 'package:e_commerceapproute/api/mapper/category_mapper.dart';
import 'package:e_commerceapproute/api/web_services.dart';
import 'package:e_commerceapproute/core/exception/app_exception.dart';
import 'package:e_commerceapproute/data/data_sources/remote/category_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource{
  WebServices webServices;
  CategoryRemoteDataSourceImpl({required this.webServices});

  @override
  Future<List<Category>?> getAllCategories() async{
    try{
      var categoryResponse=await webServices.getAllCategories();
      //todo: categoryDto => product
      return categoryResponse.data?.map((categoryDto) =>categoryDto.toCategory() ,).toList() ??[];
    }on DioException catch(e){
      String message=(e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  
}