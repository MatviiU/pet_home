import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.tabBar,
  });

  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final TabBar? tabBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      title: Text(title),
      bottom: tabBar,
      leadingWidth: 80,
      centerTitle: true,
      primary: true,
    );
  }

  @override
  Size get preferredSize {
    final tabBarHeight = tabBar?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + tabBarHeight);
  }
}
