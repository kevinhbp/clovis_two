import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../global/bin/data/view_type.dart';
import '../../global/bin/themes/our_colors.dart';
import '../../global/bin/widgets/text/text_view.dart';
import 'paginated_load_page_controller.dart';

class PaginatedLoadPage extends StatelessWidget {
  PaginatedLoadPage({super.key});

  final PaginatedLoadPageController controller = Get.find();

  @override
  Widget build(BuildContext context) => GetBuilder<PaginatedLoadPageController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const TextView(
              'Paginated load',
              type: TypographyType.titleSmall,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    controller.doRefresh();
                  },
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: ComponentColors.text.textWhite1,
                  ))
            ],
          ),
          body: PagedListView<int, String>(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<String>(
              itemBuilder: (context, item, index) =>
                  ItemView(index: index, text: item),
            ),
          ),
        ),
      );
}

class ItemView extends StatelessWidget {
  const ItemView({
    required this.index,
    required this.text,
    super.key,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    final margin = EdgeInsets.only(
      left: SpacingType.x3.value,
      right: SpacingType.x3.value,
      bottom: 2,
      top: index == 0 ? 4 : 0,
    );
    return Container(
      alignment: Alignment.centerLeft,
      margin: margin,
      padding: EdgeInsets.symmetric(
        vertical: SpacingType.x6.value,
        horizontal: SpacingType.x3.value,
      ),
      decoration: BoxDecoration(
        borderRadius: RadiusType.small.getBorderRadius(),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            OurColors.additional.blueDeFrench,
            OurColors.additional.bluePigment
          ],
        ),
      ),
      child: TextView(
        text,
        type: TypographyType.labelModerate,
        color: ComponentColors.text.textWhite1,
      ),
    );
  }
}
