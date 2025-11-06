import 'package:e_commerceapproute/domain/entities/response/product_add_cart.dart';

class AddCart {
  final String? id;
  final String? cartOwner;
  final List<AddProducts>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  AddCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
