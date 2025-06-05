import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/widgets/main_screen_widgets/pet_card.dart';

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
            _buildPetGrid(),
            buildEmptyMyPetsView(),
          ],
        ),
      ),
    );
  }

  Widget _buildPetGrid(){
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.57,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return PetCard(
          name: 'Name',
          type: 'Type',
          onTap: () {},
        );
      },
    );
  }

  Widget buildEmptyMyPetsView(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "You don't have an animal",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
