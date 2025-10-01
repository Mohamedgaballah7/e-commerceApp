
import 'package:e_commerceapproute/domain/entities/response/category.dart';

abstract class BrandRepository{
  Future<List<Category>?> getAllBrands();
}