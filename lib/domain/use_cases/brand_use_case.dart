import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:e_commerceapproute/domain/repository/brands/brand_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class BrandUseCase{
  BrandRepository brandRepository;
  // todo: constructor injection
  BrandUseCase({required this.brandRepository});
  Future<List<Category>?> invoke(){
    return brandRepository.getAllBrands();
  }
}