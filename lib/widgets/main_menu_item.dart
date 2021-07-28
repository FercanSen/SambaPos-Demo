import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
import 'package:sambapos_demo/screens/second_screen.dart';

class MainMenuItem extends StatelessWidget {
  final int index;

  MainMenuItem(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        SecondPage.routeName,
        arguments: index,
      ),
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
              provider.mainMenuList[index]["image"],
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            title: Text(provider.mainMenuList[index]["name"]),
          ),
        ),
      ),
    );
  }
}
