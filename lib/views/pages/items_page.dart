import 'package:flutter/material.dart';
import 'package:random_picker/views/pages/coin%20flip/coin_flip.dart';
import 'package:random_picker/views/pages/dice%20roll/dice_roll_items.dart';
import 'package:random_picker/views/pages/random%20color/random_color_items.dart';
import 'package:random_picker/views/pages/random%20name/random_name_items.dart';
import 'package:random_picker/views/pages/random%20number/random_number_items.dart';

class ItemsPage extends StatelessWidget {
  ItemsPage({super.key});

  final List<Map<String, dynamic>> items = [
    {'name': 'Random Name', 'desc': '🧑', 'destination': RandomName()},
    {'name': 'Random Number', 'desc': '🔢', 'destination': RandomNumber()},
    {'name': 'Coin Flip', 'desc': '🪙', 'destination': CoinFlip()},
    {'name': 'Dice Roll', 'desc': '🎲', 'destination': DiceRoll()},
    {'name': 'Card Draw', 'desc': '🃏', 'destination': ''},
    {'name': 'Random Color', 'desc': '🎨', 'destination': RandomColor()},
    {'name': 'Random Emoji', 'desc': '😊', 'destination': ''},
    {'name': 'Random Time', 'desc': '⏰', 'destination': ''},
    {'name': 'Random Image', 'desc': '🖼️', 'destination': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children:
              items.map((item) {
                return GestureDetector(
                  onTap: () {
                    if (item['destination'] != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['destination'],
                        ),
                      );
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Coming soon!'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
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
      bottomNavigationBar: SizedBox(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text('Made with ❤️ by Arya', 
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
