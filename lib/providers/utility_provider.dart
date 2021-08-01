import 'package:flutter/cupertino.dart';
import "package:flutter/services.dart" show rootBundle;

import "package:yaml/yaml.dart";

class UtilityProvider with ChangeNotifier {
  Map items = {};

  Future getYaml() async {
    final yamlString =
        await rootBundle.loadString("assets/yaml_files/menu.yaml");
    final yamlMap = loadYaml(yamlString);
    items = yamlMap;
  }

  List get mainMenuList {
    return items["menus"][0]["items"];
  }

  int indexOfMenuKey(String key) {
    final menus = items["menus"];
    var keysList = [];
    for (var i = 0; i < menus.length; i++) {
      var menusKey = menus[i]["key"];
      keysList.add(menusKey);
    }
    print(keysList.indexOf(key));
    return keysList.indexOf(key).toInt();
  }

  List drinksWithCocaCola() {
    List drinksList = items["menus"][10]["items"];
    List colaList = items["menus"][10]["items"][0]["items"];
    return colaList + drinksList.sublist(1);
  }
}
