import 'package:e_commerceapproute/domain/entities/response/product_response.dart';

abstract class ProductRepository{
  Future<List<Product>?> getAllProducts();
}