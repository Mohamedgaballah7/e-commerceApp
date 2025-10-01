
import 'package:dio/dio.dart';
import 'package:e_commerceapproute/api/api_end_points.dart';
import 'package:e_commerceapproute/api/dio/dio_interceptors.dart';
import 'package:e_commerceapproute/api/web_services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule{
  @singleton
  @injectable
  BaseOptions provideBaseOptions(){
    return BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      receiveDataWhenStatusError: true,

    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger(){
    return PrettyDioLogger(
      request: true,
      requestBody:  true,
      responseBody:  true,
      requestHeader:  true,
      responseHeader:  true,
      error: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions,PrettyDioLogger prettyDioLogger){
    var dio=Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  @injectable
  WebServices provideWebServices(Dio dio)=>WebServices(dio);
}