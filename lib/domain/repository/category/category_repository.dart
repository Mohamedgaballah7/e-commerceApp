

import 'package:e_commerceapproute/domain/entities/response/category.dart';

abstract class CategoryRepository{
  Future<List<Category>?> getAllCategories();
}