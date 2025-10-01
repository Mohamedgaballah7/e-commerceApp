
import 'package:e_commerceapproute/api/mapper/category_mapper.dart';
import 'package:e_commerceapproute/api/mapper/sub_category_mapper.dart';
import 'package:e_commerceapproute/api/model/response/product_dto.dart';
import 'package:e_commerceapproute/domain/entities/response/product_response.dart';

extension ProductMapper on ProductDto{
  Product toProduct(){
    return Product(
        id: id,
        slug: slug,
        category: category?.toCategory(),
        title: title,
        description: description,
        brand: brand?.toCategory(),
        imageCover: imageCover,
        images: images,
        price: price,
        quantity: quantity,
        ratingsAverage: ratingsAverage,
        ratingsQuantity: ratingsQuantity,
        sold: sold,
        subcategory: subcategory?.map((subcategory)=>subcategory.toSubCategory()).toList()??[]
    );
  }
}