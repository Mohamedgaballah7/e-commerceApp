import 'package:e_commerceapproute/domain/entities/response/product_response.dart';
import 'package:e_commerceapproute/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductUseCase{
  ProductRepository productRepository;
  // todo: constructor injection
  ProductUseCase({required this.productRepository});
  Future<List<Product>?> invoke(){
    return productRepository.getAllProducts();
  }
}