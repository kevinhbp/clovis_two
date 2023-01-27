import 'package:badges/badges.dart';
import 'package:easy_sidemenu/src/global/global.dart';
import 'package:easy_sidemenu/src/side_menu_display_mode.dart';

import 'package:flutter/material.dart';

class OurMenuItem extends StatefulWidget {

  const OurMenuItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.priority,
    this.width = double.infinity,
    this.badgeContent,
    this.badgeColor,
  }) : super(key: key);

  final double width;

  /// A function that call when tap on [SideMenuItem]
  final Function onTap;

  /// Title text
  final String title;

  /// A Icon to display before [title]
  final Icon icon;

  /// Priority of item to show on [SideMenu], lower value is displayed at the top
  ///
  /// * Start from 0
  /// * This value should be unique
  /// * This value used for page controller index
  final int priority;

  /// Text show next to the icon as badge
  /// By default this is null
  final Widget? badgeContent;

  // Background color for badge
  final Color? badgeColor;

  @override
  _SideMenuItemState createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<OurMenuItem> {
  double currentPage = 0;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _nonNullableWrap(WidgetsBinding.instance)!
        .addPostFrameCallback((timeStamp) {
      // set initialPage
      setState(() {
        currentPage = Global.controller.initialPage.toDouble();
      });
      if (mounted) {
        // set controller SideMenuItem page controller callback
        Global.controller.addListener(() {
          setState(() {
            currentPage = Global.controller.page!;
          });
        });
      }
    });
  }

  /// This allows a value of type T or T?
  /// to be treated as a value of type T?.
  ///
  /// We use this so that APIs that have become
  /// non-nullable can still be used with `!` and `?`
  /// to support older versions of the API as well.
  /// https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0#your-code
  T? _nonNullableWrap<T>(T? value) => value;

  /// Set background color of [SideMenuItem]
  Color _setColor() {
    if (widget.priority == currentPage) {
      return Global.style.selectedColor ?? Theme.of(context).highlightColor;
    } else if (isHovered) {
      return Global.style.hoverColor ?? Colors.transparent;
    } else {
      return Colors.transparent;
    }
  }

  /// Set icon for of [SideMenuItem]
  Widget _generateIcon(Icon mainIcon) {
    final icon = Icon(
      mainIcon.icon,
      color: widget.priority == currentPage.ceil()
          ? Global.style.selectedIconColor ?? Colors.black
          : Global.style.unselectedIconColor ?? Colors.black54,
      size: Global.style.iconSize ?? 24,
    );
    if (widget.badgeContent == null) {
      return icon;
    } else {
      return Badge(
        badgeContent: widget.badgeContent!,
        badgeColor: widget.badgeColor ?? Colors.red,
        alignment: Alignment.bottomRight,
        position: const BadgePosition(top: -13, end: -7),
        child: icon,
      );
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () => widget.onTap(),
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 50,
          width: widget.width,
          decoration: BoxDecoration(
            color: _setColor(),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: ValueListenableBuilder(
            valueListenable: Global.displayModeState,
            builder: (context, value, child) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: value == SideMenuDisplayMode.compact ? 0 : 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    _generateIcon(widget.icon),
                    const SizedBox(
                      width: 8,
                    ),
                    if (value == SideMenuDisplayMode.open)
                      Expanded(
                        child: Text(
                          widget.title,
                          style: widget.priority == currentPage.ceil()
                              ? const TextStyle(
                              fontSize: 17, color: Colors.black)
                              .merge(Global.style.selectedTitleTextStyle)
                              : const TextStyle(
                              fontSize: 17, color: Colors.black54)
                              .merge(Global.style.unselectedTitleTextStyle),
                        ),
                      ),
                  ],
                ),
              ),
          ),
        ),
      ),
    );
}
