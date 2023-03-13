// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'color_extension.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class ColorExtnesion extends ThemeExtension<ColorExtnesion> {
  const ColorExtnesion({
    required this.shadowContainerFirst,
    required this.shadowContainerSecond,
  });

  final Color shadowContainerFirst;
  final Color shadowContainerSecond;

  static final ColorExtnesion light = ColorExtnesion(
    shadowContainerFirst: _$ColorExtnesion.shadowContainerFirst[0],
    shadowContainerSecond: _$ColorExtnesion.shadowContainerSecond[0],
  );

  static final ColorExtnesion dark = ColorExtnesion(
    shadowContainerFirst: _$ColorExtnesion.shadowContainerFirst[1],
    shadowContainerSecond: _$ColorExtnesion.shadowContainerSecond[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ColorExtnesion copyWith({
    Color? shadowContainerFirst,
    Color? shadowContainerSecond,
  }) {
    return ColorExtnesion(
      shadowContainerFirst: shadowContainerFirst ?? this.shadowContainerFirst,
      shadowContainerSecond:
          shadowContainerSecond ?? this.shadowContainerSecond,
    );
  }

  @override
  ColorExtnesion lerp(ThemeExtension<ColorExtnesion>? other, double t) {
    if (other is! ColorExtnesion) return this;
    return ColorExtnesion(
      shadowContainerFirst:
          Color.lerp(shadowContainerFirst, other.shadowContainerFirst, t)!,
      shadowContainerSecond:
          Color.lerp(shadowContainerSecond, other.shadowContainerSecond, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ColorExtnesion &&
            const DeepCollectionEquality()
                .equals(shadowContainerFirst, other.shadowContainerFirst) &&
            const DeepCollectionEquality()
                .equals(shadowContainerSecond, other.shadowContainerSecond));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(shadowContainerFirst),
        const DeepCollectionEquality().hash(shadowContainerSecond));
  }
}

extension ColorExtnesionBuildContextProps on BuildContext {
  ColorExtnesion get _colorExtnesion =>
      Theme.of(this).extension<ColorExtnesion>()!;
  Color get shadowContainerFirst => _colorExtnesion.shadowContainerFirst;
  Color get shadowContainerSecond => _colorExtnesion.shadowContainerSecond;
}
