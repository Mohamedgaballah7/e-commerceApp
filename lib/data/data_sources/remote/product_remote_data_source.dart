
import 'package:e_commerceapproute/domain/entities/response/product_response.dart';

abstract class ProductRemoteDataSource{
  Future<List<Product>?> getAllProducts();
}