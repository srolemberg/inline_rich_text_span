import 'package:flutter/rendering.dart' show SelectionRegistrar;
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui show TextHeightBehavior;

/// The [InlineRichTextSpanWidget] is a wrapper for [RichText] widget which
/// displays text that could use multiple different styles. The text to display
/// may be built in multiples [InlineSpan] objects, each of which has an
/// associated style or behavior that is used for that subtree. The text might
/// break across multiple lines depending on the layout constraints.
///
/// Example:
/// ```dart
///     InlineRichTextSpanWidget(
///       children: [
///         TextSpan(text: 'Hello, '),
///         TextSpan(
///           text: 'Flutter Developers!',
///           style: TextStyle(
///             fontWeight: FontWeight.bold,
///             color: Colors.blue,
///             fontSize: 18,
///           ),
///         ),
///         TextSpan(text: ' Welcome to '),
///         TextSpan(
///           text: 'InlineRichTextSpan.',
///           style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green),
///         ),
///       ],
///       textAlign: TextAlign.center,
///     );
///   }
///
/// ```
class InlineRichTextSpanWidget extends StatelessWidget {
  /// Use multiple InlineSpan to display text in this widget
  final List<InlineSpan> children;

  //<editor-fold desc="RichText properties">
  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool softWrap;

  /// {@macro flutter.painting.textPainter.textScaler}
  final TextScaler textScaler;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  final int? maxLines;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// The [SelectionRegistrar] this rich text is subscribed to.
  ///
  /// If this is set, [selectionColor] must be non-null.
  final SelectionRegistrar? selectionRegistrar;

  /// The color to use when painting the selection.
  ///
  /// This is ignored if [selectionRegistrar] is null.
  ///
  /// See the section on selections in the [RichText] top-level API
  /// documentation for more details on enabling selection in [RichText]
  /// widgets.
  final Color? selectionColor;

  //</editor-fold>

  /// Creates a paragraph of rich text.
  ///
  /// The [maxLines] property may be null (and indeed defaults to null), but if
  /// it is not null, it must be greater than zero.
  ///
  /// The [textDirection], if null, defaults to the ambient [Directionality],
  /// which in that case must not be null.
  ///
  /// Requires a [List] to display text.
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
