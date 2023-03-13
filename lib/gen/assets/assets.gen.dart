/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/backScreen.png
  AssetGenImage get backScreen =>
      const AssetGenImage('assets/icons/backScreen.png');

  /// File path: assets/icons/cloudy.svg
  SvgGenImage get cloudy => const SvgGenImage('assets/icons/cloudy.svg');

  /// File path: assets/icons/fewCloud.svg
  SvgGenImage get fewCloud => const SvgGenImage('assets/icons/fewCloud.svg');

  /// File path: assets/icons/kapli.svg
  SvgGenImage get kapli => const SvgGenImage('assets/icons/kapli.svg');

  /// File path: assets/icons/mapIcon.svg
  SvgGenImage get mapIcon => const SvgGenImage('assets/icons/mapIcon.svg');

  /// File path: assets/icons/mist.svg
  SvgGenImage get mist => const SvgGenImage('assets/icons/mist.svg');

  /// File path: assets/icons/mostlyClouds.svg
  SvgGenImage get mostlyClouds =>
      const SvgGenImage('assets/icons/mostlyClouds.svg');

  /// File path: assets/icons/rain.svg
  SvgGenImage get rain => const SvgGenImage('assets/icons/rain.svg');

  /// File path: assets/icons/scatteredClouds.svg
  SvgGenImage get scatteredClouds =>
      const SvgGenImage('assets/icons/scatteredClouds.svg');

  /// File path: assets/icons/showerRain.svg
  SvgGenImage get showerRain =>
      const SvgGenImage('assets/icons/showerRain.svg');

  /// File path: assets/icons/snow.svg
  SvgGenImage get snow => const SvgGenImage('assets/icons/snow.svg');

  /// File path: assets/icons/sunny.svg
  SvgGenImage get sunny => const SvgGenImage('assets/icons/sunny.svg');

  /// File path: assets/icons/termometr.svg
  SvgGenImage get termometr => const SvgGenImage('assets/icons/termometr.svg');

  /// File path: assets/icons/thunderstorm.svg
  SvgGenImage get thunderstorm =>
      const SvgGenImage('assets/icons/thunderstorm.svg');

  /// File path: assets/icons/wind.svg
  SvgGenImage get wind => const SvgGenImage('assets/icons/wind.svg');
}

class $AssetsRiveGen {
  const $AssetsRiveGen();

  /// File path: assets/rive/cloud-and-sun.riv
  String get cloudAndSun => 'assets/rive/cloud-and-sun.riv';
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsRiveGen rive = $AssetsRiveGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
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

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
