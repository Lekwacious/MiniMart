import 'package:get/get.dart';
import 'package:minimart/view/cart/cart_screen.dart';
import 'package:minimart/view/dashboard/bottom_tab.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItemModel>[].obs;
  final double shippingCost = 10.0;


  void incrementQuantity(int id) {
    var item = cartItems.firstWhereOrNull((item) => item.id == id);
    if (item != null) {
      item.quantity.value++;

    }
  }

  void decrementQuantity(int id) {
    var item = cartItems.firstWhereOrNull((item) => item.id == id);
    if (item != null && item.quantity.value > 1) {
      item.quantity.value--;
    } else if (item != null && item.quantity.value == 1) {
      // Optionally, you could remove the item if quantity becomes 0
      // removeItem(id);
    }
  }

  void removeItem(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + (item.price * item.quantity.value));

  double get total => subtotal + shippingCost;

  void addToCart(CartItemModel newItem) {
    var existingItem =
        cartItems.firstWhereOrNull((item) => item.id == newItem.id);

    if (existingItem != null) {
      existingItem.quantity.value++;

      Get.to(() => const HomeNavigationBar(page: 1));
    } else {
      cartItems.add(newItem);

      Get.to(() => const HomeNavigationBar(page: 1));
    }
  }
}
