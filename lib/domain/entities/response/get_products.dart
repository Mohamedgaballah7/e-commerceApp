import 'package:e_commerceapproute/domain/entities/response/product_response.dart';

class GetProducts {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  GetProducts({this.count, this.id, this.product, this.price});
}
