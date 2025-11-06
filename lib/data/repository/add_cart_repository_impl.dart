import 'package:e_commerceapproute/data/data_sources/remote/add_cart_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/response/add_cart_response.dart';
import 'package:e_commerceapproute/domain/entities/response/get_cart_response.dart';
import 'package:e_commerceapproute/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class AddCartRepositoryImpl implements CartRepository {
  AddCartRemoteDataSource addCartRemoteDataSource;

  AddCartRepositoryImpl({required this.addCartRemoteDataSource});

  @override
  Future<AddCartResponse> addCart(String productId) {
    return addCartRemoteDataSource.addCart(productId);
  }

  @override
  Future<GetCartResponse> getItemsCart() {
    return addCartRemoteDataSource.getItemsCart();
  }
}
