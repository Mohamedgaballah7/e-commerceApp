import 'package:dio/dio.dart';
import 'package:e_commerceapproute/api/mapper/add_cart_response_mapper.dart';
import 'package:e_commerceapproute/api/mapper/get_cart_response_mapper.dart';
import 'package:e_commerceapproute/api/model/request/count_request_dto.dart';
import 'package:e_commerceapproute/api/model/request/product_id_request_dto.dart';
import 'package:e_commerceapproute/api/web_services.dart';
import 'package:e_commerceapproute/core/exception/app_exception.dart';
import 'package:e_commerceapproute/core/utils/shared_prefs_utils.dart';
import 'package:e_commerceapproute/data/data_sources/remote/add_cart_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/response/add_cart_response.dart';
import 'package:e_commerceapproute/domain/entities/response/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddCartRemoteDataSource)
class AddCartRemoteDataSourceImpl implements AddCartRemoteDataSource {
  WebServices webServices;

  AddCartRemoteDataSourceImpl({required this.webServices});

  @override
  Future<AddCartResponse> addCart(String productId) async {
    try {
      ProductIdRequestDto productRequest = ProductIdRequestDto(
        productId: productId,
      );
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var addCartResponse = await webServices.addCart(
        productRequest,
        token ?? '',
      );
      //todo: addCartResponseDto => addCartResponse
      return addCartResponse.toAddCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsCart() async {
    try {
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var getCartResponse = await webServices.getItemsInCart(token ?? '');
      //todo: getCartResponseDto => getCartResponse
      return getCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> deleteItemsCart(String productId) async {
    try {
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var deleteItemCartResponse = await webServices.deleteItemsInCart(
          productId, token ?? '');
      //todo: getCartResponseDto => getCartResponse
      return deleteItemCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> updateCountsCart(String productId, int count) async {
    try {
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      CountRequestDto countRequest = CountRequestDto(
          count: '$count'
      );
      var updateCartResponse = await webServices.updateCountsInCart(
          productId, token ?? '',
          countRequest
      );
      //todo: getCartResponseDto => getCartResponse
      return updateCartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
