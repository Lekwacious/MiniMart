import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/app_bar.dart';
import '../../controllers/cart_controller.dart';
import '../../models/cart_model.dart';
import '../../utils/app_colors.dart';

class FavouriteProductScreen extends StatelessWidget {
  FavouriteProductScreen({super.key});

  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ReusableAppBar(
          deliveryLocation: 'Umuezike Road, Oyo State',
          onNotificationPressed: () {
            Get.snackbar('Notifications', 'Notification icon tapped!',
                snackPosition: SnackPosition.BOTTOM);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back(); // Assuming you want to go back
                  },
                  child: const Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Colors.black87),
                ),
                const SizedBox(width: 12),
                Text(
                  'Your Favourites',
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
          controller.favouriteItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                          size: 80, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Your favourite is empty',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Like a product to add as to your favourite Product',
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                )
              : Obx(()=>
                Expanded(
                    child: ListView.builder(
                      itemCount: controller.favouriteItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Remove the Expanded here
                        return Column(
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
                                          controller
                                              .favouriteItems[index].imageUrl,
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
                                        child:  IconButton(
                                            icon: Icon(
                                              controller.favouriteItems[index]
                                                          .isLiked.value ==
                                                      false
                                                  ? Icons.favorite_border
                                                  : Icons.favorite,
                                              color: controller
                                                          .favouriteItems[index]
                                                          .isLiked
                                                          .value ==
                                                      false
                                                  ? Colors.black
                                                  : Colors.red,
                                            ),
                                            onPressed: () {
                                              controller.addToFavourite(
                                                  CartItemModel(
                                                      isLiked: controller
                                                          .favouriteItems[index]
                                                          .isLiked,
                                                      id: controller
                                                          .favouriteItems[index]
                                                          .id,
                                                      name: controller
                                                          .favouriteItems[index]
                                                          .name,
                                                      imageUrl:
                                                          controller
                                                              .favouriteItems[
                                                                  index]
                                                              .imageUrl,
                                                      price: controller
                                                          .favouriteItems[index]
                                                          .price));
                                              // Handle favorite
                                            },
                                          ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                controller.favouriteItems[index].name,
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
                                '\$${controller.favouriteItems[index].price}',
                                style: GoogleFonts.ibmPlexSans(
                                  textStyle: const TextStyle(
                                    fontSize: 32.75,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                              child: SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.addToCart(CartItemModel(
                                        id: controller.favouriteItems[index].id,
                                        name:
                                            controller.favouriteItems[index].name,
                                        imageUrl: controller
                                            .favouriteItems[index].imageUrl,
                                        price: controller
                                            .favouriteItems[index].price));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        appButtonColor, // Button color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
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
                        );
                      },
                    ),
                  ),
              )
        ],
      ),
    );
  }
}
