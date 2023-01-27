// ignore_for_file: implementation_imports

import 'dart:ui';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:easy_sidemenu/src/global/global.dart';
import 'package:flutter/material.dart';

import 'our_menu_item.dart';

class OurSideMenu extends StatelessWidget {
  const OurSideMenu({
    required this.items,
    required this.controller,
    this.style,
    this.padding,
    Key? key,
  }) : super(key: key);

  final PageController controller;
  final List<OurMenuItem> items;
  final SideMenuStyle? style;
  final EdgeInsets? padding;

  Decoration _decoration(SideMenuStyle? menuStyle) {
    if (menuStyle == null || menuStyle.decoration == null) {
      return BoxDecoration(
        color: Global.style.backgroundColor,
      );
    } else {
      if (menuStyle.backgroundColor != null) {
        menuStyle.decoration =
            menuStyle.decoration!.copyWith(color: menuStyle.backgroundColor);
      }
      return menuStyle.decoration!;
    }
  }

  @override
  Widget build(BuildContext context) {
    Global.controller = controller;
    items.sort((a, b) => a.priority.compareTo(b.priority));
    Global.style = style ?? SideMenuStyle();
    Global.displayModeState.change(SideMenuDisplayMode.open);
    final width = style?.openSideMenuWidth ?? 250;
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height,
      decoration: _decoration(style),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...items,
          ],
        ),
      ),
    );
  }
}

class OurTabMenu extends StatelessWidget {
  const OurTabMenu({
    required this.items,
    required this.controller,
    this.style,
    this.padding,
    Key? key,
  }) : super(key: key);

  final PageController controller;
  final List<OurMenuItem> items;
  final SideMenuStyle? style;
  final EdgeInsets? padding;

  Decoration _decoration(SideMenuStyle? menuStyle) {
    if (menuStyle == null || menuStyle.decoration == null) {
      return BoxDecoration(
        color: Global.style.backgroundColor,
      );
    } else {
      if (menuStyle.backgroundColor != null) {
        menuStyle.decoration =
            menuStyle.decoration!.copyWith(color: menuStyle.backgroundColor);
      }
      return menuStyle.decoration!;
    }
  }

  @override
  Widget build(BuildContext context) {
    Global.controller = controller;
    items.sort((a, b) => a.priority.compareTo(b.priority));
    Global.style = style ?? SideMenuStyle();
    Global.displayModeState.change(SideMenuDisplayMode.open);
    return Container(
      width: double.infinity,
      height: 58,
      decoration: _decoration(style),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        }),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...items,
            ],
          ),
        ),
      ),
    );
  }
}