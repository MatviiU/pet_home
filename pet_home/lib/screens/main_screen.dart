import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/widgets/bottom_navigation_bar.dart';
import 'package:pet_home/widgets/main_screen_widgets/empty_favorite_pets_view.dart';
import 'package:pet_home/widgets/main_screen_widgets/main_grid_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/app_logo.jpg',
              width: 70,
              height: 70,
            ),
          ),
          title: Text('Pet Home'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
          bottom: TabBar(
            tabs: [Tab(text: 'All pets'), Tab(text: 'My pets')],
            labelStyle: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: TabBarView(
          children: [
            MainGridView(),
            EmptyFavoritePetsView(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
