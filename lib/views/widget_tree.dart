import 'package:flutter/material.dart';
import 'package:random_picker/views/pages/items_page.dart';
import 'package:random_picker/views/widgets/logo_hero_widget.dart';



class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: SizedBox(height: 125, child: LogoWidget()),
        ),
      ),
      body: ItemsPage(),
    );
  }
}
