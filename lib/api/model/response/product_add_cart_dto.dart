import 'package:json_annotation/json_annotation.dart';

part 'product_add_cart_dto.g.dart';

@JsonSerializable()
class ProductsDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  ProductsDto({this.count, this.id, this.product, this.price});

  factory ProductsDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsDtoToJson(this);
  }
}
