// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryDto _$SubCategoryDtoFromJson(Map<String, dynamic> json) =>
    SubCategoryDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: json['product'] as String?,
    );

Map<String, dynamic> _$SubCategoryDtoToJson(SubCategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'product': instance.category,
    };
