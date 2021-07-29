import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
import 'package:sambapos_demo/screens/submenus.dart/submenu2_screen.dart';
import 'package:sambapos_demo/widgets/submenu_item.dart';

class SubMenu1Page extends StatelessWidget {
  static const routeName = "/sub_menu1";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    final List subMenu = ModalRoute.of(context)?.settings.arguments as List;
    final List sideDishes = provider.items["menus"][7]["items"];
    final subMenuItems = provider.items["menus"][7];
    return Scaffold(
      appBar: AppBar(
        title: Text(subMenuItems["description"]),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subMenuItems["orderTag"],
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
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          SubMenu2Page.routeName,
                          arguments: subMenu,
                        );
                      },
                      child: SubMenuItem(index, sideDishes)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
