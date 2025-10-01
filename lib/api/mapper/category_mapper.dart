
import 'package:e_commerceapproute/api/model/response/common/category_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/category.dart';

extension CategoriesResponseMapper on CategoryDto{
  Category toCategory(){
    return Category(
      id: id,
      name: name,
      image: image,
      slug: slug,
    );
  }
}