

import 'package:e_commerceapproute/domain/entities/response/category.dart';

abstract class BrandRemoteDataSource{
  Future<List<Category>?> getAllBrands();
}