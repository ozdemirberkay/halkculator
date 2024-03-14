import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;

  const Layout({required this.body, super.key, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        title: SizedBox(
          width: 48,
          child: Image.asset("assets/images/candlestick.png"),
        ),
      ),
      body: body,
    );
  }
}
