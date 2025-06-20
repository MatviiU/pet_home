import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/core/theme/app_colors.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';
import 'package:pet_home/features/auth/data/models/user.dart';
import 'package:pet_home/features/settings/presentation/widgets/settings_menu_item.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          SettingsMenuItem(title: 'Edit profile', onTap: () {}),
          const SizedBox(height: 40),
          SettingsMenuItem(title: 'Delete account', onTap: () {}),
          const SizedBox(height: 40),
          SettingsMenuItem(
            title: 'Logout',
            onTap: () {
              context.read<AppBloc>().add(AppLogoutRequested());
              // context.router.replace(const SignInRoute());
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
