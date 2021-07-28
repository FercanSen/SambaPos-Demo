import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sambapos_demo/providers/utility_provider.dart';
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
        ),
        home: MyHomePage(),
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
  void initState() {
    Provider.of<UtilityProvider>(context, listen: false).getYaml();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UtilityProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("SambaPOS"),
      ),
      body: Column(
        children: [
          // ElevatedButton(
          //   child: Text("Print"),
          //   onPressed: () {
          //     print(provider.mainMenuList);
          //   },
          // ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: provider.mainMenuList.length,
                itemBuilder: (context, index) => MainMenuItem(index)),
          ),
        ],
      ),
    );
  }
}
