import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextFieldInput BloC IDR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TextFieldInputPage(),
    );
  }
}

class TextFieldInputPage extends StatefulWidget {
  const TextFieldInputPage({super.key});

  @override
  State<TextFieldInputPage> createState() => _TextFieldInputPageState();
}

class _TextFieldInputPageState extends State<TextFieldInputPage> {
  final TextEditingController _controller = TextEditingController();
  static const _locale = 'id';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Field Input"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(prefixText: _currency),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                onChanged: (value) {
                  value = '${_formatNumber(value.replaceAll('.', ''))}';
                  _controller.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.collapsed(offset: value.length));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
