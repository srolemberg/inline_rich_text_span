import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inline_rich_text_span/inline_rich_text_span.dart';

void main() {
  runApp(const MyApp());
}

class InteractiveTextExample extends StatefulWidget {
  const InteractiveTextExample({super.key});

  @override
  State<InteractiveTextExample> createState() => _InteractiveTextExampleState();
}

class _InteractiveTextExampleState extends State<InteractiveTextExample> {
  String _message = "Tap on 'Clickable'.";
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer =
        TapGestureRecognizer()
          ..onTap = () {
            setState(() {
              _message = "'Clickable' was tapped!";
            });
          };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InlineRichTextSpanWidget(
          children: [
            const TextSpan(text: 'This is some text. '),
            TextSpan(
              text: 'Clickable',
              style: const TextStyle(
                color: Colors.purple,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: _tapRecognizer,
            ),
            const TextSpan(text: ' and some more normal text.'),
          ],
        ),
        const SizedBox(height: 20),
        Text(_message),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InlineRichTextSpanWidget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'InlineRichTextSpan Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: InteractiveTextExample(),
    );
  }
}
