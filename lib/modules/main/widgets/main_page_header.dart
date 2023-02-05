import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/bin/data/view_type.dart';
import '../../../global/bin/themes/our_colors.dart';
import '../../../global/bin/widgets/image/image_view.dart';
import '../../../global/bin/widgets/input/edit_text.dart';
import '../../../global/bin/widgets/text/text_view.dart';
import '../../../global/themes/app_theme.dart';
import '../../../main.dart';
import '../controllers/pokemon_list_controller.dart';
import '../main_page_controller.dart';

class MainPageHeader extends StatelessWidget {
  MainPageHeader({super.key});

  final MainPageController controller = Get.find();
  final PokemonListController listCtrl = Get.find();

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 200,
        elevation: 0,
        floating: false,
        pinned: true,
        iconTheme: IconThemeData(
          color: ComponentColors.text.textWhite1,
        ),
        systemOverlayStyle: AppTheme.defaultOverlay,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22.0),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          collapseMode: CollapseMode.none,
          centerTitle: true,
          expandedTitleScale: 1,
          background: Stack(
            fit: StackFit.expand,
            children: [
              Blur(
                blur: 6,
                colorOpacity: 0.25,
                blurColor: Colors.black,
                child: SizedBox(
                  width: context.width,
                  child: const ImageView(
                    imageUrl: 'https://images.pexels'
                        '.com/photos/7772559/pexels-photo-7772559'
                        '.jpeg?auto=compress&cs=tinysrgb&h=350',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const TextView(
                  'Pokédex',
                  type: TypographyType.appBarRubik,
                ),
                actions: [
                  Obx(() => IconButton(
                        onPressed: () {
                          final isLight =
                              MyApp.themeNotifier.value == ThemeMode.light;
                          final nextThemeMode =
                              isLight ? ThemeMode.dark : ThemeMode.light;
                          MyApp.themeNotifier.value = nextThemeMode;

                          controller.themeSwitcherFlag.value = !isLight;
                        },
                        color: ComponentColors.text.textWhite1,
                        splashColor: Colors.transparent,
                        icon: controller.themeSwitcherFlag.value
                            ? const Icon(Icons.light_mode_rounded)
                            : const Icon(Icons.dark_mode_rounded),
                      )),
                ],
              )
            ],
          ),
          title: EditText(
            tag: 'search',
            controller: listCtrl.searchController,
            label: 'Search for a pokémon',
            hint: 'Type pokémon name',
            style: EditTextStyle.search,
            margin: EdgeInsets.symmetric(
              horizontal: SpacingType.x1.value,
              vertical: SpacingType.x1.value,
            ),
          ),
        ),
      );
}
