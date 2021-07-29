import 'package:flutter/material.dart';

class SubMenuItem extends StatelessWidget {
  final int index;
  final List itemList;

  SubMenuItem(this.index, this.itemList);

  @override
  Widget build(BuildContext context) {
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
          child: Image.asset(
            itemList[index]["image"],
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          title: itemList[index]["name"] != null
              ? Text(itemList[index]["name"])
              : Text(itemList[index]["caption"]),
          trailing: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: (itemList[index]["price"] != null)
                ? Text(
                    itemList[index]["price"].toString(),
                    style: TextStyle(color: Colors.white),
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}
