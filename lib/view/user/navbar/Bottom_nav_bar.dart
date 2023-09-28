import 'package:easyfood/utils/colors.dart';
import 'package:easyfood/view/user/cart/cart_page.dart';
import 'package:easyfood/view/user/favourites/favourites.dart';
import 'package:easyfood/view/user/home/HomeScreen.dart';
import 'package:easyfood/view/user/person/person_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CartPage(),
    Favourites(),
    PersonPage(),
  ];

  final List<String> _titles = [
    'Home',
    'Cart',
    'Favorites',
    'Person',
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          _titles.length,
          (index) => BottomNavigationBarItem(
            backgroundColor: AppColors.paracolor,
            icon: Icon(
              _icons[index],
              color: _currentIndex == index
                  ? AppColors.containerColor // Selected icon color
                  : Colors.grey, // Unselected icon color
            ),
            label: _titles[index],
          ),
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
