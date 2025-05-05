import 'package:flutter/material.dart';
import 'dart:math';

class CoinFlip extends StatelessWidget {
  const CoinFlip({super.key});


  String getRandomItem(List<String> items) {
    if (items.isEmpty) return 'No items';
    final random = Random();
    return items[random.nextInt(items.length)];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Coin Flip'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Center(
        child: Image.asset(
          getRandomItem(['assets/images/coin/heads.png', 'assets/images/coin/tails.png']),
          width: 200,
          height: 200,
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
