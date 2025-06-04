import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/app_bar.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/app_colors.dart';
import 'cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.arrow_back_ios_new,
                        size: 20, color: Colors.black87),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Your Cart',
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
            Expanded(
              child: controller.cartItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,
                              size: 80, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'Your cart is empty!',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add some items to get started.',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      itemCount: controller.cartItems.length +
                          1, // Add 1 for the order info section
                      itemBuilder: (context, index) {
                        if (index < controller.cartItems.length) {
                          final item = controller.cartItems[index];
                          return CartItemWidget(item: item);
                        } else {
                          return _buildOrderInfoSection();
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // No top rounded corners here as it will now be part of the scrollable list
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Order Info',
            style: GoogleFonts.ibmPlexSans(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
              'Subtotal', '\$${controller.subtotal.toStringAsFixed(2)}'),
          SizedBox(height: 8),
          _buildInfoRow(
              'Shipping', '\$${controller.shippingCost.toStringAsFixed(2)}'),
          Divider(height: 24, thickness: 1, color: Colors.grey[200]),
          _buildInfoRow(
            'Total',
            '\$${controller.total.toStringAsFixed(2)}',
            isTotal: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: appButtonColor,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
            ).copyWith(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return appButtonColor.withOpacity(0.2);
                  }
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {
              // Handle checkout
              Get.snackbar(
                "Checkout",
                "Proceeding to checkout with total: \$${controller.total.toStringAsFixed(2)}",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
            child: Text(
              'Checkout (\$${controller.total.toStringAsFixed(2)})',
              style: GoogleFonts.ibmPlexSans(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.ibmPlexSans(
            fontSize: isTotal ? 17 : 15,
            color: isTotal ? Colors.black87 : Colors.grey[700],
            fontWeight: isTotal ? FontWeight.w500 : FontWeight.normal,
          ),

        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 17 : 15,
            color: isTotal ? Colors.black87 : Colors.black54,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
