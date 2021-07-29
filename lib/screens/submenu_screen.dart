import 'package:flutter/material.dart';

import 'package:sambapos_demo/widgets/submenu_item.dart';

class SubMenuPage extends StatelessWidget {
  static const routeName = "/sub_menu";

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final List mainDishes = arguments["items"];
    return Scaffold(
        appBar: AppBar(
          title: Text(arguments["description"]),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  arguments["orderTag"],
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
                  itemCount: mainDishes.length,
                  itemBuilder: (context, index) =>
                      SubMenuItem(index, mainDishes),
                ),
              )
            ],
          ),
        ));
  }
}
