import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';

class SecondPage extends StatelessWidget {
  static const routeName = "/second_page";

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)?.settings.arguments as int;
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(provider.mainMenuList[index]["name"]),
        ),
        body: Center(child: Text("SecondPage")));
  }
}
