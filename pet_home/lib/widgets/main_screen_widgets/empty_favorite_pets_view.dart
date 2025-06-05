import 'package:flutter/material.dart';

class EmptyFavoritePetsView extends StatelessWidget {
  const EmptyFavoritePetsView({super.key});

  @override
  Widget build(BuildContext context) {
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
