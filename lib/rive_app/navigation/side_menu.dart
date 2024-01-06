import 'package:bounce_fit_coach/rive_app/components/menu_row.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/models/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({this.onMenuPress, this.selectedMenu = "Home", super.key});
  final String selectedMenu;
  final Function(MenuItemModel menu)? onMenuPress;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuItemModel> _menuItem = MenuItemModel.menuItems;
  final List<MenuItemModel> _menuItem2 = MenuItemModel.menuItem2;
  bool _isDarkMode = false;

  String selectedMenu = MenuItemModel.menuItems[0].title;

  void onMenuPress(MenuItemModel menu) {
    setState(() {
      selectedMenu = menu.title;
    });
  }

  void onThemeToggle(value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,
      bottom: MediaQuery.of(context).padding.bottom),
      constraints: const BoxConstraints(maxWidth: 288),
      decoration: BoxDecoration(
        color: RiveAppTheme.background2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.person_outline),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ashu",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "Inter"),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Software Engineering",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15,
                          fontFamily: "Inter"),
                    )
                  ],
                )
              ],
            ),
          ),
          MenuButtonSection(
            title: "Brower",
            menuItem: _menuItem,
            selectedMenu: selectedMenu,
            onMenuPress: onMenuPress,
          ),
          Spacer(),
          Row(
            children: [
              const SizedBox(width: 22,),
              Expanded(
                child: Text(_menuItem2[0].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600)),
              ),
              CupertinoSwitch(value: _isDarkMode, onChanged: onThemeToggle)
            ],

          ),
          //SizedBox(height: 10,)
        ],
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection(
      {Key? key,
      this.onMenuPress,
      this.selectedMenu = "Home",
      required this.title,
      required this.menuItem})
      : super(key: key);

  final String selectedMenu;
  final Function(MenuItemModel menu)? onMenuPress;
  final String title;
  final List<MenuItemModel> menuItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 10,
        // ),
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500),
          ),
        ),
        for (var menu in menuItem) ...[
          Divider(
            color: Colors.white.withOpacity(0.1),
            thickness: 1,
            height: 1,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MenuRow(
              menu: menu,
              selectedMenu: selectedMenu,
              onMenuPress: () => onMenuPress!(menu),
            ),
          ),
        ]
      ],
    );
  }
}
