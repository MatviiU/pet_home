import 'package:flutter/material.dart';
import 'package:pet_home/core/widgets/pet_card.dart';

class ProfileGridView extends StatelessWidget {
  const ProfileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.65,
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
