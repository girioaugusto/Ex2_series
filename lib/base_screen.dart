import 'package:app2_series/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [const Text('Eu amo séries 🎬')],
        ),
      ),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}
