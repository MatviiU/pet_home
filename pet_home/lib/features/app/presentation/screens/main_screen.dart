import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:pet_home/core/router/app_router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), FavoritesRoute(), ProfileRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
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
      },
    );
  }
}
