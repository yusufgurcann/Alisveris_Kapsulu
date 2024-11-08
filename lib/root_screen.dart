import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.home),
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.search),
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.shopping_cart),
            icon: Badge(
              backgroundColor: Colors.red,
              textColor: Colors.white,
              label: Text("5"),
              child: Icon(CupertinoIcons.shopping_cart),
            ),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.profile_circled),
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}