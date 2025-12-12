
import 'package:flutter/material.dart';

void main() {
  runApp(const BabiLEvreni());
}

class BabiLEvreni extends StatelessWidget {
  const BabiLEvreni({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('BabiLEvreni VIP')),
        body: const Center(child: Text('Hoş geldin kral!')),
      ),
    );
  }
}
