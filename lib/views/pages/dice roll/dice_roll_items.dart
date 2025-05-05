import 'package:flutter/material.dart';
import 'package:random_picker/views/pages/dice%20roll/one_dice_roll.dart';
import 'package:random_picker/views/pages/dice%20roll/two_dice_roll.dart';

class DiceRoll extends StatelessWidget {
  DiceRoll({super.key});

  final List<Map<String, dynamic>> items = [
    {'name': 'One Dice', 'desc': '🎲', 'destination': OneDiceRoll()},
    {'name': 'Two dice', 'desc': '🎲 🎲', 'destination': TwoDiceRoll()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roll'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(

          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(30),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children:
                items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['destination'],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['desc']!,
                              style: const TextStyle(fontSize: 30),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item['name']!,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
