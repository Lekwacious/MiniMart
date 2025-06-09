import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String deliveryLocation;
  final VoidCallback? onNotificationPressed;
  final ValueChanged<String>? onSearchChanged;
  final TextEditingController? searchController;

  const ReusableAppBar({
    super.key,
    required this.deliveryLocation,
    this.onNotificationPressed,
    this.onSearchChanged,
    this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF93C5FD), // Logo background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Full Logo',
              style: GoogleFonts.ibmPlexSans( // Matched font style
                color: const Color(0xFF2563EB),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'DELIVERY ADDRESS',
            style: GoogleFonts.ibmPlexSans(
              textStyle: const TextStyle(
                fontSize: 10,
                color: appDarkGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            deliveryLocation,
            style: GoogleFonts.ibmPlexSans(
              textStyle: const TextStyle(
                fontSize: 12,
                color: appDarkGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none_outlined,
              color: Colors.grey[500], size: 28),
          onPressed: onNotificationPressed,
        ),
        const SizedBox(width: 8),
      ],
        bottom: searchController != null?  PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: GoogleFonts.ibmPlexSans(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: appGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ),
      ): null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50.0);
}