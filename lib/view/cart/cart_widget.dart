import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimart/utils/app_colors.dart'; // Ensure this path is correct

import '../../controllers/cart_controller.dart';
import '../../models/cart_model.dart'; // Ensure this path is correct

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final CartController controller = Get.find(); // Find the existing controller

  CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xffF6F5F8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              item.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[200],
                  child:
                  Icon(Icons.image_not_supported, color: Colors.grey[400]),
                );
              },
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute content vertically
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]
                  ),
                ),
                Text(
                  item.stockStatus,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[400],
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push quantity and delete apart
                  children: [
                    // Quantity Controls
                    Row(
                      children: [
                        _buildQuantityButton(
                          icon: Icons.remove,
                          onPressed: () =>
                              controller.decrementQuantity(item.id),
                          isEnabled: item.quantity.value > 1, // Disable if quantity is 1
                        ),
                        Obx(() => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          child: Text(
                            '${item.quantity.value}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        )),
                        _buildQuantityButton(
                          icon: Icons.add,
                          onPressed: () =>
                              controller.incrementQuantity(item.id),
                        ),
                      ],
                    ),
                    // Delete Button
                    InkWell(
                      onTap: () => controller.removeItem(item.id),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15.0), // Make it circular
                        ),
                        child: Icon(Icons.delete_outline,
                            color: Colors.grey[700], size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Removed const SizedBox(width: 12.0) here, as it was trailing and not serving a clear purpose
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
      {required IconData icon,
        required VoidCallback onPressed,
        bool isEnabled = true}) {
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: BorderRadius.circular(20), // For splash effect
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: isEnabled
              ? Colors.blue.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(32), // Circular background
        ),
        child: Icon(
          icon,
          size: 20,
          color: isEnabled ? appDarkGreyColor : Colors.grey, // Ensure appDarkGreyColor is defined in app_colors.dart
        ),
      ),
    );
  }
}