import 'package:flutter/material.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Center(
        child: Image.asset(
              'assets/images/logo.png',
              width: 400,
              height: 400,
            ),
      ),
    );
  }
}


