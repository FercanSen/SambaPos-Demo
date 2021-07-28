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
    return items["menus"][0]["items"][0]["items"];
  }
}
