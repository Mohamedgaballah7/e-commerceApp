
import 'package:e_commerceapproute/api/model/response/sub_category_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/sub_category.dart';

extension SubcategoryMapper on SubCategoryDto{
  Subcategory toSubCategory(){
    return Subcategory(
        name: name,
        slug: slug,
        id: id,
        category: category
    );
  }
}