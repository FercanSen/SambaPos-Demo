import 'package:flutter/material.dart';

import 'package:sambapos_demo/screens/submenus.dart/submenu1_screen.dart';
import 'package:sambapos_demo/widgets/submenu_item.dart';

class SubMenuPage extends StatelessWidget {
  static const routeName = "/sub_menu";

  @override
  Widget build(BuildContext context) {
    final List arguments = ModalRoute.of(context)?.settings.arguments as List;
    final List mainDishes = arguments[0]["items"];
    final List subMenu = arguments[1];
    return Scaffold(
        appBar: AppBar(
          title: Text(arguments[0]["description"]),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  arguments[0]["orderTag"],
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
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        SubMenu1Page.routeName,
                        arguments: subMenu,
                      );
                    },
                    child: SubMenuItem(index, mainDishes),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
