import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimart/controllers/cart_controller.dart';
import 'package:minimart/models/cart_model.dart';
import 'package:minimart/utils/app_colors.dart';

import '../../component/app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  ProductDetailsScreen({super.key, required this.product});
  var controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        deliveryLocation: 'Umuezike Road, Oyo State',
        onNotificationPressed: () {
          Get.snackbar('Notifications', 'Notification icon tapped!',
              snackPosition: SnackPosition.BOTTOM);
        },
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Colors.black87),
                  const SizedBox(width: 12),
                  Text(
                    'Get back',
                    style: GoogleFonts.ibmPlexSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      height: 331,
                      decoration: BoxDecoration(
                        color: Colors.grey[
                            100], // Background color of the image container
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                product["imagePath"]!,
                                fit: BoxFit.fitWidth,
                                height: 350,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Obx(()=>
                                IconButton(
                                  icon: Icon(
                                    product["isLiked"].value == false
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    color: product["isLiked"].value == false
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                  onPressed: () {
                                    controller.addToFavourite(CartItemModel(
                                        isLiked: product['isLiked'],
                                        id: int.parse(product['id']!),
                                        name: product['name']!,
                                        imageUrl: product['imagePath']!,
                                        price: double.parse(product['price']!)

                                    )
                                    );
                                    // Handle favorite
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      product['name']!,
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      '\$${product['price']!}',
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: const TextStyle(
                          fontSize: 32.75,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'About this item',
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBulletPoint(
                          product["details"]!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  controller.addToCart(CartItemModel(
                      id: int.parse(product['id']!),
                      name: product['name']!,
                      imageUrl: product['imagePath']!,
                      price: double.parse(product['price']!)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appButtonColor, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  elevation: 0, // No shadow
                ),
                child: Text(
                  'Add to cart',
                  style: GoogleFonts.ibmPlexSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: GoogleFonts.ibmPlexSans(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF999999),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.ibmPlexSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF999999),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
