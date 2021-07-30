import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
import 'package:sambapos_demo/screens/second_screen.dart';
import 'package:sambapos_demo/screens/submenu_screen.dart';
import 'package:sambapos_demo/screens/submenus.dart/dessert_screen.dart';
import 'package:sambapos_demo/screens/submenus.dart/drink_screen.dart';
import 'package:sambapos_demo/screens/submenus.dart/submenu1_screen.dart';
import 'package:sambapos_demo/screens/submenus.dart/submenu2_screen.dart';
import 'package:sambapos_demo/widgets/main_menu_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UtilityProvider>(
      create: (context) => UtilityProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFde3939),
          accentColor: Color(0xFFde3939),
        ),
        home: MyHomePage(),
        routes: {
          SecondPage.routeName: (context) => SecondPage(),
          SubMenuPage.routeName: (context) => SubMenuPage(),
          SubMenu1Page.routeName: (context) => SubMenu1Page(),
          SubMenu2Page.routeName: (context) => SubMenu2Page(),
          DrinksPage.routeName: (context) => DrinksPage(),
          DessertPage.routeName: (context) => DessertPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context, listen: false);
    return FutureBuilder(
      future: Provider.of<UtilityProvider>(context, listen: false).getYaml(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("SambaPOS"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  provider.items["menus"][0]["description"],
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
                  itemCount: provider.mainMenuList.length,
                  itemBuilder: (context, index) => MainMenuItem(index),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
