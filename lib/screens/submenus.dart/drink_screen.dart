import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
import 'package:sambapos_demo/screens/submenus.dart/dessert_screen.dart';
import 'package:sambapos_demo/widgets/submenu_item.dart';

class DrinksPage extends StatelessWidget {
  static const routeName = "/drink";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    final List subMenu = ModalRoute.of(context)?.settings.arguments as List;
    final subMenuItems = provider.items["menus"][10];
    final drinksWithCocaCola = provider.drinksWithCocaCola();

    return Scaffold(
      appBar: AppBar(
        title: Text("İçecek Menüsü"),
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
                itemCount: drinksWithCocaCola.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (subMenu.contains("indirimli-menu-tatli")) {
                      Navigator.of(context).pushNamed(
                        DessertPage.routeName,
                        arguments: subMenu,
                      );
                    }
                  },
                  child: SubMenuItem(index, drinksWithCocaCola),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
