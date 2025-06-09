import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimart/controllers/product_controller.dart';
import 'package:minimart/utils/app_colors.dart';

import '../../component/app_bar.dart';
import '../product/product_details.dart';
import '../product/product_item.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    controller.searchController.addListener(() {
      controller.searchProducts(controller.searchController.text);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReusableAppBar(
        deliveryLocation: 'Umuezike Road, Oyo State',
        onNotificationPressed: () {
          Get.snackbar('Notifications', 'Notification icon tapped!',
              snackPosition: SnackPosition.BOTTOM);
        },
        searchController: controller.searchController,
        onSearchChanged: (value) {
          print('Search query: $value');
        },
      ),
      body: ListView(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 19.75, top: 6, bottom: 6),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, color: appGreyColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Technology',
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
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, top: 12, bottom: 12),
            child: Text(
              'Smartphones, Laptops &\nAccessories',
              style: GoogleFonts.ibmPlexMono(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(() {
              if (controller.productData.isEmpty &&
                  controller.searchTerm.value.isNotEmpty) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "No products found for \"${controller.searchTerm.value}\"",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 16, color: appGreyColor),
                  ),
                ));
              }
              if (controller.productData.isEmpty &&
                  controller.searchTerm.value.isEmpty) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "No products available.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 16, color: appGreyColor),
                  ),
                ));
              }
              return GridView.builder(
                itemCount: controller.productData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product = controller.productData[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(
                            product: product,
                          ));
                    },
                    child: ProductItem(
                      imagePath: product['imagePath'] ??
                          'https://placehold.co/300x300/CCCCCC/333?text=No+Image',
                      name: product['name'] ?? 'N/A',
                      details: product['details'] ?? 'No details',
                      price: product['price'] ?? '\$0.00',
                      isLike: product['isLiked'],

                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
