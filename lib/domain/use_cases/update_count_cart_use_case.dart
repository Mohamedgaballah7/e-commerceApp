import 'package:e_commerceapproute/domain/entities/response/get_cart_response.dart';
import 'package:e_commerceapproute/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId, int count) {
    return cartRepository.updateCountsCart(productId, count);
  }
}
