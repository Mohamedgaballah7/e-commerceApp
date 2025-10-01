import 'package:dio/dio.dart';
import 'package:e_commerceapproute/api/api_end_points.dart';
import 'package:e_commerceapproute/api/model/request/login_request_dto.dart';
import 'package:e_commerceapproute/api/model/request/register_request_dto.dart';
import 'package:e_commerceapproute/api/model/response/auth_response_dto.dart';
import 'package:e_commerceapproute/api/model/response/brands_response_dto.dart';
import 'package:e_commerceapproute/api/model/response/category_response_dto.dart';
import 'package:e_commerceapproute/api/model/response/product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndPoints.loginEndPoint)
  Future<AuthResponse>login(@Body() LoginRequest loginRequest);

  @POST(ApiEndPoints.registerEndPoint)
  Future<AuthResponse>register(@Body() RegisterRequest registerRequest);

  @GET(ApiEndPoints.categoriesEndPoint)
  Future<CategoryResponseDto>getAllCategories();

  @GET(ApiEndPoints.brandsEndPoint)
  Future<BrandsResponseDto>getAllBrands();

  @GET(ApiEndPoints.productsEndPoint)
  Future<ProductResponseDto>getAllProducts();
}
