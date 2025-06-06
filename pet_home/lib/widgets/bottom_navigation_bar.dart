import 'package:flutter/material.dart';
import 'package:pet_home/styles/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomNavigationBar(
        backgroundColor: AppColors.darkGreen,
        selectedItemColor: AppColors.lightGreen,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/house_icon.png',
              width: 40,
              height: 40,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/heart_icon.png',
              width: 40,
              height: 40,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/person_icon.png',
              width: 40,
              height: 40,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
