import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_home/features/app/bloc/app_bloc.dart';
import 'package:pet_home/features/auth/data/models/user.dart';
import 'package:pet_home/features/settings/presentation/screens/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showModalBottomSheet(context, user);
      },
      icon: Image.asset(
        'assets/icons/settings_icon.png',
        width: 40,
        height: 40,
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, UserModel user) {
    final double sheetHeight = MediaQuery.of(context).size.height * 0.67;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxHeight: sheetHeight, minHeight: sheetHeight),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      builder: (innerContext) {
        return BlocProvider.value(
          value: context.read<AppBloc>(),
          child: Settings(user: user),
        );
      },
    );
  }
}
