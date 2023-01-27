import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../strings/strings.dart';
import '../../data/file_drop_type.dart';
import '../../data/our_file.dart';
import '../../data/view_type.dart';
import '../../themes/our_colors.dart';
import '../button/button_view.dart';
import '../card/card_view.dart';
import '../text/text_view.dart';


enum FileDropperHeight {
  h300(300);

  const FileDropperHeight(this.size);

  final double size;
}

class FileDropperViewController extends GetxController {
  FileDropperViewController(this.dropType);

  FileDropType dropType;
  Function(List<OurFile>)? onSelected;

  DropzoneViewController? dzController;

  final isHover = false.obs;
  final errorMessage = ''.obs;
  final selectedViews = <Widget>[].obs;
  final selectedSource = <OurFile>[].obs;

  Future<void> onUploadButtonClicked() async {
    if (dzController == null) {
      return;
    }

    final mMulti = !dropType.singleSelect;

    final picked = await dzController!
        .pickFiles(mime: dropType.fileTypes.mime, multiple: mMulti);

    await onFileSelected('upload button', picked);
  }

  void clear() {
    selectedViews.value = [];
    selectedSource.value = [];
    errorMessage.value = '';
    if (onSelected != null) {
      onSelected!([]);
    }
  }

  void addSelectedViewsFromUrls(List<OurFile> items) {
    final sv = <Widget>[];
    for (final item in items) {
      /*final mShowCase = SizedBox(
        width: 180,
        height: 180,
        child: CardView(
          color: ComponentColors.background.card,
          shadowType: ShadowType.none,
          radiusType: RadiusType.subLarge,
          margin: EdgeInsets.symmetric(horizontal: SpacingType.x1.value),
          child: Image.memory(
            item.source,
            width: 180,
            height: 180,
            filterQuality: FilterQuality.medium,
          ),
        ),
      );*/
      final mIndex = items.indexOf(item);

      final mShowCase = SizedBox(
        width: 188,
        height: 188,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: CardView(
                color: ComponentColors.background.card,
                shadowType: ShadowType.none,
                radiusType: RadiusType.subLarge,
                child: Image.memory(
                  item.source,
                  width: 180,
                  height: 180,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  selectedViews.removeAt(mIndex);
                  selectedSource.removeAt(mIndex);
                },
                child: CardView(
                  color: Colors.white,
                  radiusType: RadiusType.circle,
                  child: Padding(
                    padding: EdgeInsets.all(SpacingType.x1.value),
                    child: Assets.images.global.icActionTrash.svg(
                      width: IconSize.micro.size,
                      height: IconSize.micro.size,
                      color: ComponentColors.text.textGray1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      sv.add(mShowCase);
    }

    selectedViews.value = sv;
    selectedSource.value = items;

    if (onSelected != null) {
      onSelected!(selectedSource);
    }
  }

  int _maxFileMegaBytes() => dropType.maxFileSizeInMB;

  double _maxBytes() => _maxFileMegaBytes() * 1024 * 1024;

  double _maxImageWidthPx() => dropType.maxImagePxWidth;

  double _minImageWidthPx() => dropType.minImagePxWidth;

  double _maxImageHeightPx() => dropType.maxImagePxHeight;

  double _minImageHeightPx() => dropType.minImagePxHeight;

  Future<void> onFileSelected(String source, List<dynamic> files) async {
    if (kDebugMode) {
      print('on files selected [$source]');
    }
    if (dzController == null) {
      return;
    }

    errorMessage.value = '';

    for (final xFile in files) {
      final mName = await dzController!.getFilename(xFile);
      final mSize = await dzController!.getFileSize(xFile);
      if (mSize > _maxBytes()) {
        errorMessage.value = 'File $mName exceed maximum file size of'
            ' ${dropType.maxFileSizeInMB} MB';
        return;
      }
      final mFile = await dzController!.getFileData(xFile);

      final mIndex = files.indexOf(xFile);

      // If max width / height or min width / height above zero check to file.
      if (_maxImageWidthPx() > 0 ||
          _maxImageHeightPx() > 0 ||
          _minImageWidthPx() > 0 ||
          _minImageHeightPx() > 0) {

        // region PIXEL CHECKING
        final decodeImage = await decodeImageFromList(mFile);
        final theWidth = decodeImage.width;
        final theHeight = decodeImage.height;

        // check width
        if (_minImageWidthPx() == _maxImageWidthPx()) {
          if (theWidth != _minImageWidthPx()) {
            errorMessage.value = '$mName width is not ${_minImageWidthPx()}px'
                '\nYour file width pixels is $theWidth';
            return;
          }
        } else {
          if (_maxImageWidthPx() > 0 && theWidth > _maxImageWidthPx()) {
            errorMessage.value = '$mName'
                '\nexceed maximum ${_maxImageWidthPx()}px'
                '\nYour file width pixels is $theWidth';
            return;
          }
          if (_minImageWidthPx() > 0 && theWidth < _minImageWidthPx()) {
            errorMessage.value = '$mName'
                '\nbelow minimum ${_minImageWidthPx()}px'
                '\nYour file width pixels is $theWidth';
            return;
          }
        }

        // check height
        if (_minImageHeightPx() == _maxImageHeightPx()) {
          if (theHeight != _minImageHeightPx()) {
            errorMessage.value = '$mName height is not ${_minImageHeightPx()}px'
                '\nYour file height pixels is $theHeight';
            return;
          }
        } else {
          if (_maxImageHeightPx() > 0 && theHeight > _maxImageHeightPx()) {
            errorMessage.value = '$mName'
                '\nexceed maximum ${_maxImageHeightPx()}px'
                '\nYour file height pixels is $theHeight';
            return;
          }
          if (_minImageHeightPx() > 0 && theWidth < _minImageHeightPx()) {
            errorMessage.value = '$mName'
                '\nbelow minimum ${_minImageHeightPx()}px'
                '\nYour file height pixels is $theHeight';
            return;
          }
        }
        // endregion

        /*final mShowCase = SizedBox(
          width: 188,
          height: 188,
          child: CardView(
            color: ComponentColors.background.card,
            shadowType: ShadowType.none,
            radiusType: RadiusType.subLarge,
            margin: EdgeInsets.symmetric(horizontal: SpacingType.x1.value),
            child: Image.memory(
              mFile,
              width: 180,
              height: 180,
              filterQuality: FilterQuality.medium,
            ),
          ),
        );*/

        final mShowCase = SizedBox(
          width: 188,
          height: 188,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: CardView(
                  color: ComponentColors.background.card,
                  shadowType: ShadowType.none,
                  radiusType: RadiusType.subLarge,
                  child: Image.memory(
                    mFile,
                    width: 180,
                    height: 180,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    selectedViews.removeAt(mIndex);
                    selectedSource.removeAt(mIndex);
                  },
                  child: CardView(
                    color: Colors.white,
                    radiusType: RadiusType.circle,
                    child: Padding(
                      padding: EdgeInsets.all(SpacingType.x1.value),
                      child: Assets.images.global.icActionTrash.svg(
                        width: IconSize.micro.size,
                        height: IconSize.micro.size,
                        color: ComponentColors.text.textGray1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        selectedViews.add(mShowCase);
        selectedSource.add(OurFile(filename: mName, source: mFile));
      } else {
        /*final mShowCase = SizedBox(
          width: 188,
          height: 188,
          child: CardView(
            color: ComponentColors.background.card,
            shadowType: ShadowType.none,
            radiusType: RadiusType.subLarge,
            margin: EdgeInsets.symmetric(horizontal: SpacingType.x1.value),
            child: Image.memory(
              mFile,
              width: 180,
              height: 180,
              filterQuality: FilterQuality.medium,
            ),
          ),
        );*/

        final mShowCase = SizedBox(
          width: 188,
          height: 188,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: CardView(
                  color: ComponentColors.background.card,
                  shadowType: ShadowType.none,
                  radiusType: RadiusType.subLarge,
                  child: Image.memory(
                    mFile,
                    width: 180,
                    height: 180,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    selectedViews.removeAt(mIndex);
                    selectedSource.removeAt(mIndex);
                  },
                  child: CardView(
                    color: Colors.white,
                    radiusType: RadiusType.circle,
                    child: Padding(
                      padding: EdgeInsets.all(SpacingType.x1.value),
                      child: Assets.images.global.icActionTrash.svg(
                        width: IconSize.micro.size,
                        height: IconSize.micro.size,
                        color: ComponentColors.text.textGray1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        selectedViews.add(mShowCase);
        selectedSource.add(OurFile(filename: mName, source: mFile));
      }


    }

    if (onSelected != null) {
      onSelected!(selectedSource);
    }
  }
}

class FileDropperView extends StatelessWidget {
  const FileDropperView({
    required this.tag,
    required this.controller,
    required this.height,
    this.margin,
    Key? key,
  }) : super(key: key);

  final String tag;
  final FileDropperViewController controller;

  final FileDropperHeight height;
  final EdgeInsets? margin;

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(
            vertical: SpacingType.x5.value,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height.size,
            child: Stack(
              children: [
                Obx(() =>
                    _BackgroundView(controller.isHover.value ? 1.0 : 0.6)),
                _DropzoneView(controller),
                Obx(
                      () => _InformationView(
                    controller,
                    show: controller.selectedViews.isEmpty,
                  ),
                ),
                Obx(() => _ErrorView(controller.errorMessage.value)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: SpacingType.x3.value,
            ),
            child: TextView(
              controller.dropType.fileHint,
              type: TypographyType.bodySmall,
              color: ComponentColors.text.textGray1,
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundView extends StatelessWidget {
  const _BackgroundView(this.opacity, {Key? key}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    opacity: opacity,
    duration: const Duration(milliseconds: 200),
    child: DottedBorder(
      radius: RadiusType.subLarge.getRadius(),
      borderType: BorderType.RRect,
      color: Theme.of(context).colorScheme.outline,
      strokeCap: StrokeCap.round,
      dashPattern: const [6, 8, 3, 8],
      strokeWidth: 2.6,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: RadiusType.subLarge.getBorderRadius(),
        ),
      ),
    ),
  );
}

class _DropzoneView extends StatelessWidget {
  const _DropzoneView(this.controller, {Key? key}) : super(key: key);

  final FileDropperViewController controller;

  @override
  Widget build(BuildContext context) => DropzoneView(
    operation: controller.dropType.operation,
    cursor: controller.dropType.cursorType,
    mime: [...controller.dropType.fileTypes.mime],
    onCreated: (dzController) {
      controller.dzController = dzController;
      if (kDebugMode) {
        print('[DROPZONE] [CREATED]');
      }
    },
    onLoaded: () {
      if (kDebugMode) {
        print('[DROPZONE] [LOADED]');
      }
    },
    onError: (error) {
      if (kDebugMode) {
        print('[DROPZONE] [ERROR] - $error');
      }
    },
    onHover: () {
      if (!controller.isHover.value) {
        controller.isHover.value = true;
        controller.errorMessage.value = 'Drop the file here!';
      }
    },
    onLeave: () {
      if (controller.isHover.value) {
        controller.isHover.value = false;
        controller.errorMessage.value = '';
      }
    },
    onDrop: (file) async {
      /*if (controller.isHover.value) {
            controller.isHover.value = false;
            controller.errorMessage.value = 'File dropped, please wait!';
            await controller.onFileSelected('drop file', <dynamic>[file]);
          }*/
    },
    onDropMultiple: (files) async {
      if (controller.isHover.value) {
        controller.isHover.value = false;
        controller.errorMessage.value = 'Files dropped, please wait!';
        await controller.onFileSelected('drop files', files ?? <dynamic>[]);
      }
    },
  );
}

class _InformationView extends StatelessWidget {
  const _InformationView(this.controller, {required this.show, Key? key})
      : super(key: key);

  final FileDropperViewController controller;
  final bool show;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: const Duration(milliseconds: 200),
    child: show
        ? _PreSelectInformationView(controller)
        : _PostSelectInformationView(controller),
  );
}

class _PreSelectInformationView extends StatelessWidget {
  const _PreSelectInformationView(this.controller, {Key? key}) : super(key: key);

  final FileDropperViewController controller;

  @override
  Widget build(BuildContext context) => Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.illustration.illustrationImageFile.image(
              filterQuality: FilterQuality.medium,
              width: IconSize.moderate.size,
              height: IconSize.moderate.size,
            ),
            Container(
              margin: EdgeInsets.only(bottom: SpacingType.x3.value),
              width: 350,
              child: TextView(
                Strings.dropFileToUpload(
                    controller.dropType.fileTypes.description),
                type: TypographyType.bodyModerate,
                textAlign: TextAlign.center,
              ),
            ),
            ButtonView(
              iconLeft: Icon(
                Icons.file_upload_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: IconSize.small.size,
              ),
              label: Strings.upload,
              onPressed: () {
                controller.onUploadButtonClicked();
              },
              type: ButtonType.tertiary,
              state: ButtonState.active,
            ),
          ],
        ),
      ],
    ),
  );
}

class _PostSelectInformationView extends StatelessWidget {
  const _PostSelectInformationView(this.controller, {Key? key}) : super(key: key);

  final FileDropperViewController controller;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...controller.selectedViews,
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: SpacingType.x1.value),
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonView(
                label: Strings.hapus,
                size: ButtonSize.large,
                margin: EdgeInsets.symmetric(horizontal: SpacingType.x1.value),
                type: ButtonType.secondary,
                iconLeft: const Icon(
                    Icons.delete_forever_outlined
                ),
                state: ButtonState.active,
                onPressed: () {
                  controller.clear();
                },
              ),
              SizedBox(width: SpacingType.x1.value),
              ButtonView(
                label: Strings.tambah,
                size: ButtonSize.large,
                margin: EdgeInsets.symmetric(horizontal: SpacingType.x1.value),
                type: ButtonType.secondary,
                iconLeft: const Icon(Icons.add),
                state: ButtonState.active,
                onPressed: () {
                  controller.onUploadButtonClicked();
                },
              )
            ],
          ),
        )
      ],
    ),
  );
}

class _ErrorView extends StatelessWidget {
  const _ErrorView(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    opacity: message.isEmpty ? 0.0 : 1.0,
    duration: const Duration(milliseconds: 200),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: SpacingType.x3.value),
        width: 500,
        child: TextView(
          message,
          type: TypographyType.bodySmall,
          color: ComponentColors.text.textRed1,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
