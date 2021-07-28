import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambapos_demo/providers/utility_provider.dart';

class MainMenuItem extends StatelessWidget {
  final int index;

  MainMenuItem(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    return GridTile(
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
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              provider.mainMenuList[index]["image"],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          title: Text(provider.mainMenuList[index]["name"]),
          // trailing: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
          //   child: Text(
          //     provider.mainMenuList[index]["price"].toString(),
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ),
      ),
    );
  }
}
