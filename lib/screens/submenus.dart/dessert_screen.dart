import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
import 'package:sambapos_demo/widgets/submenu_item.dart';

class DessertPage extends StatelessWidget {
  static const routeName = "/dessert";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    final List sideDishes = provider.items["menus"][9]["items"];
    final subMenuItems = provider.items["menus"][9];
    return Scaffold(
      appBar: AppBar(
        title: Text("Tatlı Menüsü"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subMenuItems["description"],
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: sideDishes.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: SubMenuItem(index, sideDishes),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
