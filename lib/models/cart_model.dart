import 'package:get/get.dart';

class CartItemModel {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String stockStatus;
  RxInt quantity;
  final RxBool isLiked;

  CartItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.stockStatus = 'In stock',
    int initialQuantity = 1,
    RxBool? isLiked,
  })  : quantity = initialQuantity.obs,
        isLiked = isLiked ?? false.obs;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItemModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}