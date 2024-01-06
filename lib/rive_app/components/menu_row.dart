import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/models/menu_items.dart';

class MenuRow extends StatelessWidget {
  const MenuRow(
      {Key? key,
      required this.menu,
      this.selectedMenu = "Home",
      this.onMenuPress})
      : super(key: key);

  final MenuItemModel menu;
  final String selectedMenu;
  final Function? onMenuPress;

  void _onMenupress() {
    onMenuPress!();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: selectedMenu==menu.title?288-16:0,
          height: 56,
          curve: const Cubic(0.2, 0.8, 0.2 ,1),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ) ,
        CupertinoButton(
          padding: const EdgeInsets.all(12),
          pressedOpacity: 1,
          onPressed: _onMenupress,
        child: Row(
          children: [
            Text(
              menu.title,
              style: const TextStyle(
                
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
        
      ),
      ]
    );
  }
}
