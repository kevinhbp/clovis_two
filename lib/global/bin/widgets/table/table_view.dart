import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../text/text_view.dart';

class TableRowItem {
  TableRowItem({
    required this.items,
    this.id = -1,
    this.onTap,
  });

  final int id;
  final List<TableCellItem> items;
  final Function(int)? onTap;
}

class TableCellItem {
  TableCellItem({
    required this.flex,
    required this.text,
  });

  final int flex;
  final String text;
}

// --
class TableView extends StatelessWidget {
  TableView({
    required this.header,
    required this.items,
    this.margin,
    super.key,
  });

  final TableRowItem header;
  final List<TableRowItem> items;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: Column(
          children: [
            TableHeaderView(item: header),
            SizedBox(
              height: 680,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => TableRowView(
                  item: items[index],
                ),
              ),
            )
          ],
        ),
      );
}

// --
class TableHeaderView extends StatelessWidget {
  const TableHeaderView({required this.item, super.key});

  final TableRowItem item;

  List<Widget> generateCells(List<TableCellItem> cellsItem) {
    final result = <Widget>[];
    for (final it in cellsItem) {
      final cell = Expanded(
        flex: it.flex,
        child: TableCellView(
          text: it.text,
          textType: TypographyType.labelLarge,
          textColor: ComponentColors.text.textBlack3,
        ),
      );
      result.add(cell);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            BoxDecoration(border: Border.all(color: OurColors.neutral.c90)),
        child: Material(
          color: OurColors.neutral.c99,
          child: Row(
            children: [...generateCells(item.items)],
          ),
        ),
      );
}

class TableRowView extends StatelessWidget {
  const TableRowView({required this.item, super.key});

  final TableRowItem item;

  List<Widget> generateCells(List<TableCellItem> cellsItem) {
    final result = <Widget>[];
    for (final it in cellsItem) {
      final cell = Expanded(
        flex: it.flex,
        child: TableCellView(
          text: it.text,
          textType: TypographyType.bodyModerate,
          textColor: ComponentColors.text.textBlack3,
        ),
      );
      result.add(cell);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: OurColors.neutral.c90,
            ),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (item.onTap != null) {
                item.onTap!(item.id);
              }
            },
            child: Row(
              children: [...generateCells(item.items)],
            ),
          ),
        ),
      );
}

class TableCellView extends StatelessWidget {
  const TableCellView({
    required this.text,
    required this.textType,
    required this.textColor,
    this.alignment = Alignment.centerLeft,
    this.padding,
    super.key,
  });

  final String text;
  final TypographyType textType;
  final Color textColor;
  final Alignment alignment;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Container(
        alignment: alignment,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: SpacingType.x3.value,
              vertical: SpacingType.x3.value,
            ),
        child: TextView(text, type: textType, color: textColor),
      );
}
