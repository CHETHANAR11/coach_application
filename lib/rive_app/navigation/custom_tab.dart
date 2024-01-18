import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:bounce_fit_coach/rive_app/models/tab_item.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key, required this.onTabchange}) : super(key: key);

  final Function(int tabIndex) onTabchange;

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  final List<TabItem> _icons = TabItem.tabItemsList;

  int _selectedTab = 0;

  void _onRiveIconInit(Artboard artboard, index) {
    final controller = StateMachineController.fromArtboard(
        artboard, _icons[index].stateMachine);
    artboard.addController(controller!);

    _icons[index].status = controller.findInput<bool>("active") as SMIBool;
  }

  void onTapPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
      widget.onTabchange(index);

      _icons[index].status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        _icons[index].status!.change(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        padding: const EdgeInsets.all(1),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(24),
        //   gradient: LinearGradient(colors: [
        //     Colors.white.withOpacity(0.5),
        //     Colors.white.withOpacity(0),
        //   ]),
        // ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: RiveAppTheme.background2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: RiveAppTheme.background2.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 20))
              ]
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _icons.length,
              (index) {
                TabItem icon = _icons[index];

                return Expanded(
                  key: icon.id,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(12),
                    child: AnimatedOpacity(
                      opacity: _selectedTab == index ? 1 : 0.5,
                      duration: const Duration(milliseconds: 200),
                      child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: -4,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 4,
                                width: _selectedTab == index ? 20 : 0,
                                decoration: BoxDecoration(
                                  color: RiveAppTheme.accentColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: RiveAnimation.asset(
                                'assets/rive/icons.riv',
                                stateMachines: [icon.stateMachine],
                                artboard: icon.artboard,
                                onInit: (artboard) {
                                  _onRiveIconInit(artboard, index);
                                },
                              ),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      onTapPress(index);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
