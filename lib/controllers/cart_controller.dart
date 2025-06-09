import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimart/view/dashboard/bottom_tab.dart';

import '../component/app_snackbars.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItemModel>[].obs;
  var favouriteItems = <CartItemModel>[].obs;
  final double shippingCost = 10.0;

  int get totalCartItems => cartItems.length;
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
      AppSnackBars.successSnackBar(message: "Item has been added to cart", icon: const Icon(Icons.check_circle_outline_outlined));
      Get.to(() => const HomeNavigationBar(page: 1));
    }
  }
  void addToFavourite(CartItemModel newItem) {
    var existingItem = favouriteItems.firstWhereOrNull((item) => item.id == newItem.id);
    if (existingItem != null) {
      existingItem.isLiked.value = false;
      favouriteItems.remove(existingItem);

      AppSnackBars.successSnackBar(
        message: "Item has been unliked",
        icon: const Icon(Icons.check_circle_outline_outlined),
      );
    } else {
      newItem.isLiked.value = true;
      favouriteItems.add(newItem);

      AppSnackBars.successSnackBar(
        message: "Item has been added to favourite",
        icon: const Icon(Icons.check_circle_outline_outlined),
      );
    }
  }

}
