import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
import 'package:sambapos_demo/screens/submenu_screen.dart';

class SecondaryMenuItem extends StatelessWidget {
  final int index;
  final int argumentIndex;

  SecondaryMenuItem(this.index, this.argumentIndex);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    final Map secondaryMenu =
        provider.mainMenuList[argumentIndex]["items"][index];
    final List? subMenu =
        provider.mainMenuList[argumentIndex]["items"][index]["subMenus"];
    return GestureDetector(
      onTap: () {
        if (secondaryMenu.containsKey("subMenus")) {
          if (subMenu!.contains("kirmizi-et-ana-yemekler")) {
            var mapInfo = provider.items["menus"][1];
            Navigator.of(context).pushNamed(
              SubMenuPage.routeName,
              arguments: [
                mapInfo,
                subMenu,
              ],
            );
          }
          if (subMenu.contains("beyaz-et-ana-yemekler")) {
            var mapInfo = provider.items["menus"][2];
            Navigator.of(context).pushNamed(
              SubMenuPage.routeName,
              arguments: [
                mapInfo,
                subMenu,
              ],
            );
          }
          if (subMenu.contains("sebzeli-etli-indirimli-menu-ana-yemekler")) {
            var mapInfo = provider.items["menus"][3];
            Navigator.of(context).pushNamed(
              SubMenuPage.routeName,
              arguments: [
                mapInfo,
                subMenu,
              ],
            );
          }
          if (subMenu.contains("diyet-indirimli-menu-ana-yemekler")) {
            var mapInfo = provider.items["menus"][4];
            Navigator.of(context).pushNamed(
              SubMenuPage.routeName,
              arguments: [
                mapInfo,
                subMenu,
              ],
            );
          }
          if (subMenu.contains("vejeteryan-indirimli-menu-ana-yemekler")) {
            var mapInfo = provider.items["menus"][5];
            Navigator.of(context).pushNamed(
              SubMenuPage.routeName,
              arguments: [
                mapInfo,
                subMenu,
              ],
            );
          }
          if (subMenu.contains("cocacola-indirimli-menu-ana-yemekler")) {
            Map mapInfo = provider.items["menus"][6];
            Navigator.of(context).pushNamed(
              SubMenuPage.routeName,
              arguments: [
                mapInfo,
                subMenu,
              ],
            );
          }
        } else
          print("Selected menu does not contain subMenus");
      },
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              provider.mainMenuList[argumentIndex]["items"][index]["image"],
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            title: Text(
                provider.mainMenuList[argumentIndex]["items"][index]["name"]),
            // title: Text(provider.mainMenuList[argumentIndex]["items"]),
            trailing: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                provider.mainMenuList[argumentIndex]["items"][index]["price"]
                    .toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
