import 'package:flutter/material.dart';
import 'package:pet_home/widgets/main_screen_widgets/pet_card.dart';

class MainGridView extends StatelessWidget {
  const MainGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
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
}
