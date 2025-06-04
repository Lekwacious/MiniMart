
import 'package:get/get.dart';

class CartItemModel {
  final int id;
  final String name;
  final String imageUrl; // Placeholder for actual image path or URL
  final double price;
  final String stockStatus;
  RxInt quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.stockStatus = 'In stock',
    int initialQuantity = 1,
  }) : quantity = initialQuantity.obs;
}