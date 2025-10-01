

import 'package:e_commerceapproute/domain/entities/response/category.dart';

abstract class CategoryRemoteDataSource{
  Future<List<Category>?> getAllCategories();
}