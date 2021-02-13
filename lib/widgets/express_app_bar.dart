import 'package:flutter/material.dart';

class ExpressAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExpressAppBar({this.title, this.actions});
  final String title;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
