import 'package:flutter/rendering.dart' show SelectionRegistrar;
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui show TextHeightBehavior;

class InlineRichTextSpanWidget extends StatelessWidget {
  final List<InlineSpan> children;

  //<editor-fold desc="RichText properties">
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextScaler textScaler;
  final TextOverflow overflow;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final SelectionRegistrar? selectionRegistrar;
  final Color? selectionColor;

  //</editor-fold>

  const InlineRichTextSpanWidget({
    super.key,
    required this.children,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
    this.textScaler = TextScaler.noScaling,
    this.overflow = TextOverflow.clip,
    this.textWidthBasis = TextWidthBasis.parent,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.selectionRegistrar,
    this.selectionColor,
  });

  @override
  RichText build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionRegistrar: selectionRegistrar,
      selectionColor: selectionColor,
      text: TextSpan(children: children),
    );
  }
}
