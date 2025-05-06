import 'dart:math';
import 'package:flutter/material.dart';

class RandomColor extends StatefulWidget {
  const RandomColor({super.key});

  @override
  State<RandomColor> createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> {

  int getRandomItem() {
    final random = Random();
    return random.nextInt(256);
  }

  late List<int> colors;

  @override
  void initState() {
    super.initState();
    colors = [getRandomItem(), getRandomItem(), getRandomItem()];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice Roll'), centerTitle: true),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(colors[0], colors[1], colors[2], 1),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Text(
              'RGB (${colors[0]}, ${colors[1]}, ${colors[2]})',
              style: TextStyle(
                color:
                    (colors[0] > 127 && colors[1] > 127 && colors[2] > 127)
                        ? Colors.black
                        : Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 25.0),
        child: FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: FilledButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: const Size(200, 55),
          ),
          child: const Text('Try again', style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
