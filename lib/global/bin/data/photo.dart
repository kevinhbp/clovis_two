import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/assets.gen.dart';

class Photo {
  Photo(this.name, this.description, this.agi, this.imageUrl);

  factory Photo.fromAssetGenImage(String name, String description,
      AssetGenImage agi) =>
      Photo(name, description, agi, '');

  factory Photo.fromUrl(String name, String description, String imageUrl) =>
      Photo(name, description, null, imageUrl);

  final String name;
  final String description;
  final AssetGenImage? agi;
  final String imageUrl;

  // --
  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.high,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    if (agi == null) {
      // fallback if agi is null
      return Assets.images.global.icImageError.image(
        key: key,
        bundle: bundle,
        frameBuilder: frameBuilder,
        errorBuilder: errorBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        scale: scale,
        width: width,
        height: height,
        color: color,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        isAntiAlias: isAntiAlias,
        package: package,
        filterQuality: filterQuality,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
      );
    }

    return agi!.image(
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  CachedNetworkImage networkImage({
    Key? key,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    Alignment alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    FilterQuality filterQuality = FilterQuality.low,
    PlaceholderWidgetBuilder? placeholder,
    LoadingErrorWidgetBuilder? errorWidget,
  }) =>
      CachedNetworkImage(
        imageUrl: imageUrl,
        key: key,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        filterQuality: filterQuality,
        placeholder: placeholder,
        errorWidget: errorWidget,
      );
}
