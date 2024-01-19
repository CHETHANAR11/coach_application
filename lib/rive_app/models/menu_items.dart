import 'package:flutter/cupertino.dart';

class MenuItemModel {
  MenuItemModel({this.id, this.title = ""});

  UniqueKey? id = UniqueKey();
  String title;

  static List<MenuItemModel> menuItems = [
    MenuItemModel(title: "Home"),
    MenuItemModel(title: "About"),
    MenuItemModel(title: "Setting"),
    MenuItemModel(title: "Theme"),
  ];

  static List<MenuItemModel> menuItem2 = [
    MenuItemModel(
      title: "Dark Mode"
    )
  ];
}
