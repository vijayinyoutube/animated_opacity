import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool _visible = true;
  bool showPayBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.00),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 650),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                '${showPayBtn ? 'Proceed to pay' : 'Checkout'} ',
                style: const TextStyle(color: Colors.black),
              ),
              onPressed: () => _changeOpacity(),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _changeOpacity() async {
    setState(() => _visible = !_visible);
    await Future.delayed(const Duration(milliseconds: 650));
    setState(() => showPayBtn = !showPayBtn);
    setState(() => _visible = !_visible);
  }
}
