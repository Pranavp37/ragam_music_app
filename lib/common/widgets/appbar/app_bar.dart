import 'package:flutter/material.dart';
import 'package:ragam/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar(
      {super.key,
      this.titile,
      this.hidebackBtn = false,
      this.action,
      this.backgrdcolor});
  final Widget? titile;
  final bool hidebackBtn;
  final Widget? action;
  final Color? backgrdcolor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgrdcolor ?? Colors.transparent,
      elevation: 0,
      title: titile ?? const Text(''),
      actions: [action ?? Container()],
      centerTitle: true,
      leading: hidebackBtn
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkmode
                      ? Colors.white.withOpacity(.03)
                      : Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17,
                  color: context.isDarkmode ? Colors.white : Colors.black,
                ),
              )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
