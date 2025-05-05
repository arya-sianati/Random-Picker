import 'package:flutter/material.dart';
import 'package:random_picker/views/pages/random_picker_page.dart';

class RandomName extends StatefulWidget {
  const RandomName({super.key});

  @override
  State<RandomName> createState() => _RandomNameState();
}

class _RandomNameState extends State<RandomName> {
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<String> savedItems = [];

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addInputField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeInputField(int index) {
    if (_controllers.length <= 1) return;
    setState(() {
      _controllers[index].dispose();
      _controllers.removeAt(index);
    });
  }

  void _saveItems() {
    savedItems.clear();
    for (var controller in _controllers) {
      if (controller.text.trim().isNotEmpty) {
        savedItems.add(controller.text.trim());
      }
    }
  }

  List<String> getSavedItems() {
    return List<String>.from(savedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Name Picker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _controllers.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _controllers[i],
                              decoration: InputDecoration(
                                labelText: 'Item ${i + 1}',
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
                        if (_controllers.length > 1)
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () => _removeInputField(i),
                            ),
                          ),
                        // const SizedBox(width: 30.0),
                        // else
                        // const SizedBox(width: 50.0),
                      ],
                    ),
                  ),
                FilledButton(
                  onPressed: () {
                    _addInputField();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
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
            if (_controllers.any((controller) => controller.text.isEmpty)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all fields'),
                  duration: Duration(seconds: 2),
                ),
              );
              return;
            }
            _saveItems();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RandomPickerPage(savedItems: savedItems),
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
