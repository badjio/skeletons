import 'package:flutter/material.dart';

const SHIMMER_GRADIENT = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFD6D6E4),
    Color(0xFFD1D1DF),
    Color(0xFFD6D6E4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.0,
    0.3,
    0.5,
    0.7,
    1,
  ],
  begin: Alignment(-2.4, -0.2),
  end: Alignment(2.4, 0.2),
  tileMode: TileMode.clamp,
);

const DARK_SHIMMER_GRADIENT = LinearGradient(
  colors: [
    Color(0xFF222222),
    Color(0xFF242424),
    Color(0xFF2B2B2B),
    Color(0xFF242424),
    Color(0xFF222222),
  ],
  stops: [
    0.0,
    0.2,
    0.5,
    0.8,
    1,
  ],
  begin: Alignment(-2.4, -0.2),
  end: Alignment(2.4, 0.2),
  tileMode: TileMode.clamp,
);

class SkeletonAvatarStyle {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;

  const SkeletonAvatarStyle({
    this.width = 48,
    this.height = 48,
    this.padding = const EdgeInsets.all(0),
    this.shape = BoxShape.rectangle,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });
}

class SkeletonLineStyle {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool? randomLength;
  final double? minLength;
  final double? maxLength;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry? borderRadius;

  const SkeletonLineStyle(
      {this.width,
      this.height = 18,
      this.padding = const EdgeInsets.all(0),
      this.randomLength,
      this.borderRadius = const BorderRadius.all(Radius.circular(2)),
      this.minLength,
      this.maxLength,
      this.alignment = AlignmentDirectional.centerStart})
      : assert(minLength == null ||
            (minLength > 0 && (maxLength == null || maxLength > minLength))),
        assert(maxLength == null ||
            (maxLength > 0 && (minLength == null || minLength < maxLength)));
}

class SkeletonParagraphStyle {
  final int lines;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final SkeletonLineStyle lineStyle;

  const SkeletonParagraphStyle({
    this.lines = 3,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    this.spacing = 12,
    this.lineStyle = const SkeletonLineStyle(),
  });
}

class SkeletonListTileStyle {
  final bool hasLeading;
  final SkeletonAvatarStyle? leadingStyle;
  final SkeletonLineStyle? titleStyle;
  final bool hasSubtitle;
  final SkeletonLineStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final double? contentSpacing;
  final double? verticalSpacing;

  const SkeletonListTileStyle({
    this.hasLeading = true,
    this.leadingStyle, //  = const SkeletonAvatarStyle(padding: EdgeInsets.all(0)),
    this.titleStyle = const SkeletonLineStyle(
      padding: EdgeInsets.all(0),
      height: 22,
    ),
    this.subtitleStyle = const SkeletonLineStyle(
      height: 16,
      padding: EdgeInsetsDirectional.only(end: 32),
    ),
    this.hasSubtitle = false,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.contentSpacing = 8,
    this.verticalSpacing = 8,
  });
}
