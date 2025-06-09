

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBars {
  static errorSnackBar({required String message,required Widget icon} ) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      message: message,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: Get.width / 1.85,
            child: Wrap(
              children: [
                Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.all(24),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      icon: const Icon(
        Icons.cancel,
        color: Colors.white,
      ),
      isDismissible: false,
      backgroundColor: Colors.red,
    );
  }

  static noInternet({required String message, message2, required Widget icon}) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.GROUNDED,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(.2),
          spreadRadius: 5,
          blurRadius: 5,
        )
      ],
      message: message,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: Get.width / 1.85,
            child: Wrap(
              children: [
                Text(
                  '$message' + ' $message2',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.all(24),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      icon: const Icon(
        Icons.cancel,
        color: Colors.grey,
      ),
      isDismissible: false,
      backgroundColor: Colors.white,
    );
  }

  static successSnackBar({required String message, required Widget icon}) {
    return Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      message: message,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.width / 1.85,
            child: Wrap(
              children: [
                Text(
                  message,
                  style: const TextStyle(color: Color(0xff334155)),
                ),
              ],
            ),
          ),
          const Icon(Icons.cancel)
        ],
      ),
      margin: const EdgeInsets.all(24),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      icon: const Icon(
        Icons.check_circle_rounded,
        color: Colors.green,
      ),
      isDismissible: false,
      backgroundColor: Colors.white,
    );
  }
}
