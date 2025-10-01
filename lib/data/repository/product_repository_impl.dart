import 'package:e_commerceapproute/data/data_sources/remote/product_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/response/product_response.dart';
import 'package:e_commerceapproute/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<List<Product>?> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }


}