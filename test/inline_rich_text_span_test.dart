import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:inline_rich_text_span/inline_rich_text_span.dart';

import 'package:flutter/material.dart';

void main() {
  group('InlineRichTextSpanWidget', () {
    testWidgets('renders RichText with basic TextSpan children', (
      WidgetTester tester,
    ) async {
      const testChildren = [
        TextSpan(text: 'Hello '),
        TextSpan(text: 'World', style: TextStyle(fontWeight: FontWeight.bold)),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(children: testChildren),
          ),
        ),
      );

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final RichText richTextWidget = tester.widget(richTextFinder);
      expect(richTextWidget.text, isA<TextSpan>());
      final TextSpan rootSpan = richTextWidget.text as TextSpan;
      expect(rootSpan.children, equals(testChildren));
    });

    testWidgets('applies textAlign property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Aligned')],
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.textAlign, TextAlign.center);
    });

    testWidgets('applies textDirection property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Direction')],
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.textDirection, TextDirection.rtl);
    });

    testWidgets('applies softWrap property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Soft Wrap')],
              softWrap: false,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.softWrap, false);
    });

    testWidgets('applies textScaler property', (WidgetTester tester) async {
      const testScaler = TextScaler.linear(1.5);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Scaled Text')],
              textScaler: testScaler,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.textScaler, testScaler);
    });

    testWidgets('applies overflow property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [
                TextSpan(text: 'Overflowing Text Here To Cause Overflow'),
              ],
              overflow: TextOverflow.ellipsis,
              maxLines:
                  1, // Overflow needs maxLines to be effective for ellipsis
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('applies maxLines property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Max Lines Text')],
              maxLines: 2,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.maxLines, 2);
    });

    testWidgets('applies locale property', (WidgetTester tester) async {
      const testLocale = Locale('es', 'ES');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Locale Text')],
              locale: testLocale,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.locale, testLocale);
    });

    testWidgets('applies strutStyle property', (WidgetTester tester) async {
      final testStrutStyle = StrutStyle(fontSize: 16, forceStrutHeight: true);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Strut Style Text')],
              strutStyle: testStrutStyle,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.strutStyle, testStrutStyle);
    });

    testWidgets('applies textWidthBasis property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Text Width Basis')],
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.textWidthBasis, TextWidthBasis.longestLine);
    });

    testWidgets('applies textHeightBehavior property', (
      WidgetTester tester,
    ) async {
      const testTextHeightBehavior = TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Text Height Behavior')],
              textHeightBehavior: testTextHeightBehavior,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.textHeightBehavior, testTextHeightBehavior);
    });

    // SelectionRegistrar and selectionColor are harder to test in isolation
    // without a more complex setup involving actual selection.
    // These tests primarily confirm that the properties are passed down.
    testWidgets('applies selectionColor property', (WidgetTester tester) async {
      const testSelectionColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Selectable Text')],
              selectionColor: testSelectionColor,
              // selectionRegistrar is needed for selectionColor to have an effect
              selectionRegistrar: FakeSelectionRegistrar(),
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.selectionColor, testSelectionColor);
    });

    testWidgets('applies selectionRegistrar property', (
      WidgetTester tester,
    ) async {
      final testSelectionRegistrar = FakeSelectionRegistrar();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineRichTextSpanWidget(
              children: const [TextSpan(text: 'Selectable Text')],
              selectionRegistrar: testSelectionRegistrar,
              selectionColor: Colors.red,
            ),
          ),
        ),
      );

      final RichText richTextWidget = tester.widget(find.byType(RichText));
      expect(richTextWidget.selectionRegistrar, testSelectionRegistrar);
    });

    testWidgets(
      'uses default values when optional properties are not provided',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: InlineRichTextSpanWidget(
                children: const [TextSpan(text: 'Default Values')],
              ),
            ),
          ),
        );

        final RichText richTextWidget = tester.widget(find.byType(RichText));
        expect(richTextWidget.textAlign, TextAlign.start); // Default
        expect(
          richTextWidget.textDirection,
          null,
        ); // Default (will inherit from parent)
        expect(richTextWidget.softWrap, true); // Default
        expect(richTextWidget.overflow, TextOverflow.clip); // Default
        expect(richTextWidget.textScaler, TextScaler.noScaling); // Default
        expect(richTextWidget.maxLines, null); // Default
        expect(richTextWidget.locale, null); // Default
        expect(richTextWidget.strutStyle, null); // Default
        expect(richTextWidget.textWidthBasis, TextWidthBasis.parent); // Default
        expect(richTextWidget.textHeightBehavior, null); // Default
        expect(richTextWidget.selectionRegistrar, null); // Default
        expect(
          richTextWidget.selectionColor,
          null,
        ); // Default (will use default selection color from theme)
      },
    );
  });
}

// A simple fake implementation for testing purposes.
// In a real scenario with complex selection interaction, you might need a more robust mock.
class FakeSelectionRegistrar extends Fake implements SelectionRegistrar {
  @override
  void add(Selectable selectable) {}

  @override
  void remove(Selectable selectable) {}
}
