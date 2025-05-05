import 'package:flutter/material.dart';

class RandomPickerPage extends StatelessWidget {
  const RandomPickerPage({super.key, required this.item});
  final String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('Random Picker'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Center(
        child: Text(item, style: TextStyle(fontSize: 24)),
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
