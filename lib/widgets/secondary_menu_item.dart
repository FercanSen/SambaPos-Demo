import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';

class SecondaryMenuItem extends StatelessWidget {
  final int index;
  final int argumentIndex;

  SecondaryMenuItem(this.index, this.argumentIndex);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => print(index),
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
