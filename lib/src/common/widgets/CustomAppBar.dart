import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  const MyAppBar({super.key, this.leading, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(color: MyColors.whiteColor),
      ),
      backgroundColor: MyColors.primaryColor,
      iconTheme: const IconThemeData(color: MyColors.whiteColor),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
