
import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:e_commerceapproute/domain/entities/response/meta_data.dart';

class BrandsResponse {
  final int? results;
  final MetaData? metadata;
  final List<Category>? data;

  BrandsResponse ({
    this.results,
    this.metadata,
    this.data,
  });
}



