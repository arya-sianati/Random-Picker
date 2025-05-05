import 'package:flutter/material.dart';
import 'dart:math';

import 'package:random_picker/views/pages/random_picker_page.dart';

class RandomNumber extends StatefulWidget {
  const RandomNumber({super.key});

  @override
  State<RandomNumber> createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {
  TextEditingController controllerfirst = TextEditingController();
  TextEditingController controllerlast = TextEditingController();

  @override
  void dispose() {
    controllerfirst.dispose();
    controllerlast.dispose();
    super.dispose();
  }

  String getRandomInRange(int min, int max) {
    final random = Random();
    return (min + random.nextInt(max - min + 1)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Name Picker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controllerfirst,
                      decoration: InputDecoration(
                        labelText: 'First Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onEditingComplete: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controllerlast,
                    decoration: InputDecoration(
                      labelText: 'Last Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onEditingComplete: () {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 25.0),
        child: FilledButton(
          onPressed: () {
            if (controllerfirst.text.isEmpty || controllerlast.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all fields'),
                  duration: Duration(seconds: 2),
                ),
              );
              return;
            }
            else if (int.tryParse(controllerfirst.text) == null || int.tryParse(controllerlast.text) == null) {
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please enter valid numbers'),
                duration: Duration(seconds: 2),
              ),
              );
              return;
            }
            else if (int.parse(controllerfirst.text) > int.parse(controllerlast.text)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('First number should be less than last number'),
                  duration: Duration(seconds: 2),
                ),
              );
              return;
            }
            else if (controllerfirst.text == controllerlast.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Both numbers are the same'),
                  duration: Duration(seconds: 2),
                ),
              );
              return;
            }

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => RandomPickerPage(
                      item: getRandomInRange(
                        int.parse(controllerfirst.text),
                        int.parse(controllerlast.text),
                      ),
                    ),
              ),
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: const Size(200, 55),
          ),
          child: const Text('Pick Random Item', style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
