import 'package:flutter/material.dart';
import 'package:random_picker/views/pages/random_name.dart';
import 'package:random_picker/views/pages/random_number.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  final List<Map<String, dynamic>> items = const [
    {'name': 'Random Name', 'desc': '🧑', 'destination': RandomName()},
    {'name': 'Random Number', 'desc': '🔢', 'destination': RandomNumber()},
    {'name': 'Coin Flip', 'desc': '🪙', 'destination': ''},
    {'name': 'Dice Roll', 'desc': '🎲', 'destination': ''},
    {'name': 'Card Draw', 'desc': '🃏', 'destination': ''},
    {'name': 'Random Color', 'desc': '🎨', 'destination': ''},
    {'name': 'Random Emoji', 'desc': '😊', 'destination': ''},
    {'name': 'Random Time', 'desc': '⏰', 'destination': ''},
    {'name': 'Random Image', 'desc': '🖼️', 'destination': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView.count(
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
    );
  }
}
