import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/theme/app_colors.dart';
import 'package:pet_home/features/auth/data/models/user.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.chocolate, width: 5),
          ),
          child: Icon(Icons.person, size: 60, color: AppColors.black),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            '${user.name ?? "No name"} ${user.surname ?? "No surname"}',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
