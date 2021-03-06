import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';

import 'package:sambapos_demo/widgets/secondary_menu_item.dart';

class SecondPage extends StatelessWidget {
  static const routeName = "/second_page";

  @override
  Widget build(BuildContext context) {
    final argumentIndex = ModalRoute.of(context)?.settings.arguments as int;
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.mainMenuList[argumentIndex]["name"]),
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          itemCount: provider.mainMenuList[argumentIndex]["items"].length,
          itemBuilder: (context, index) => SecondaryMenuItem(
            index,
            argumentIndex,
          ),
        ),
      ),
    );
  }
}
