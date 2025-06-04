import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../cart/cart_screen.dart';
import '../product/favourite_products.dart';
import '../profile/profile_screen.dart';
import 'home.dart';

class HomeNavigationBar extends StatefulWidget {
  final int page;
  const HomeNavigationBar({super.key, required this.page});

  @override
  State<StatefulWidget> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  late int _currentTabIndex = widget.page;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> shouldExit() async {
    Get.back;

    return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text('Close app?'),
                content: const Text("Click back again to close app"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text("Okay"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(true);
                      SystemNavigator.pop();
                    },
                  )
                ],
              );
            }) ??
        false;
  }

  Widget _buildActiveIconContainer(Widget icon) {
    return Container(
      height: 32,
      width: 56,
      decoration: BoxDecoration(
        color: appButtonColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
       Home(),
      const CartScreen(),
      const FavouriteProductScreen(),
      const ProfileScreen(),
    ];

    const double iconSize = 24.0;

    final kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Image.asset(
          "assets/pngs/home_icon.png",
          color: Colors.grey,
          width: iconSize,
          height: iconSize,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.home, color: Colors.white, size: iconSize),
        ),
        label: 'Home',
        activeIcon: _buildActiveIconContainer(
          Image.asset(
            "assets/pngs/home_icon.png",
            color: Colors.white,
            width: iconSize,
            height: iconSize,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.home, color: Colors.white, size: iconSize),
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/pngs/cart.png",
          color: Colors.grey,
          width: iconSize,
          height: iconSize,
          errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
              size: iconSize),
        ),
        label: 'Cart',
        activeIcon: _buildActiveIconContainer(
          Image.asset(
            "assets/pngs/cart.png",
            color: Colors.white,
            width: iconSize,
            height: iconSize,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.shopping_cart, color: Colors.white, size: iconSize),
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite_border,
            color: Colors.grey, size: iconSize),
        label: 'Favourite',
        activeIcon: _buildActiveIconContainer(
          const Icon(Icons.favorite_border,
              color: Colors.white,
              size: iconSize), // Using filled favorite for active
        ),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/pngs/person.png",
          color: Colors.grey,
          width: iconSize,
          height: iconSize,
          errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: iconSize),
        ),
        label: 'Profile',
        activeIcon: _buildActiveIconContainer(
          Image.asset(
            "assets/pngs/person.png",
            color: Colors.white,
            width: iconSize,
            height: iconSize,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.person, color: appButtonColor, size: iconSize),
          ),
        ),
      ),
    ];

    assert(kTabPages.length == kBottmonNavBarItems.length);

    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedItemColor: appButtonColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
          color: appButtonColor,
          fontSize: 10),
      unselectedLabelStyle: const TextStyle(
          fontFamily: 'Satoshi', fontWeight: FontWeight.w700, fontSize: 10),
      items: kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
