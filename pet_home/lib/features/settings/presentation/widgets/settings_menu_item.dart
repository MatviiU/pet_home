import 'package:flutter/material.dart';
import 'package:pet_home/core/theme/app_colors.dart';

class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.displayMedium!.copyWith(color: AppColors.beige),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.beige,
          size: 35,
        ),
      ),
      onTap: onTap,
    );
  }
}
