import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> _allProducts = [
    {
      'id': '1',
      'imagePath': 'assets/pngs/apple.png',
      'name': 'Apple iPhone 16',
      'details': '128GB Teal',
      'price': '700.00',
      "isLiked": false.obs,
    },
    {
      'id': '2',
      'imagePath': 'assets/pngs/laptop.png',
      'name': 'M4 Macbook Air 13"',
      'details': '256GB Sky blue',
      'price': '1000.00',
      "isLiked": false.obs,
    },
    {
      'id': '3',
      'imagePath': 'assets/pngs/google.png',
      'name': 'Google Pixel 9A',
      'details': '128GB Iris',
      'price': '499.00',
      "isLiked": false.obs,
    },
    {
      'id': '4',
      'imagePath': 'assets/pngs/earpod.png',
      'name': 'Apple Airpods 4',
      'details': 'Active Noise Cancellation...',
      'price': '129.00',
      "isLiked": false.obs,
    },
  ];
  final RxList<Map<String, dynamic>> productData = <Map<String, dynamic>>[].obs;


  final RxString searchTerm = ''.obs;

  @override
  void onInit() {
    super.onInit();
    productData.assignAll(_allProducts);
    ever(searchTerm, (_) => _filterProducts());
  }

  void _filterProducts() {
    final query = searchTerm.value.toLowerCase();
    if (query.isEmpty) {
      productData.assignAll(_allProducts);
    } else {
      productData.assignAll(_allProducts.where((product) {
        final productName = product['name']?.toLowerCase() ?? '';
        final productDetails = product['details']?.toLowerCase() ?? '';
        return productName.contains(query) || productDetails.contains(query);
      }).toList());
    }
  }


  void searchProducts(String query) {
    searchTerm.value = query;
  }
}