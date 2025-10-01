
import 'package:e_commerceapproute/api/model/response/common/category_dto.dart';
import 'package:e_commerceapproute/api/model/response/common/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brands_response_dto.g.dart';

@JsonSerializable()
class BrandsResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetaDataDto? metadata;
  @JsonKey(name: "data")
  final List<CategoryDto>? data;

  BrandsResponseDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BrandsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandsResponseDtoToJson(this);
  }
}



