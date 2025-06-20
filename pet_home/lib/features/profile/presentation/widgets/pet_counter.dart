import 'package:flutter/material.dart';
import 'package:pet_home/core/theme/app_colors.dart';

class PetCounter extends StatelessWidget {
  const PetCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 67,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.lightBrown,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.beige,
            child: Text(
              '2',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Pets',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
