//import 'package:bounce_fit_coach/rive_app/components/vcard.dart';
import 'package:bounce_fit_coach/rive_app/components/hcard.dart';
import 'package:bounce_fit_coach/rive_app/models/courses.dart';
import 'package:bounce_fit_coach/rive_app/components/gamefill_tab.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/navigation/timer_tab.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<CourseModel> _details = CourseModel.details;
  List<String> selectedPlayers = [];
 String gameName = ''; 
  String gameTime = '';
  void handleDeselect() {
    setState(() {
      selectedPlayers = [];
    });
  }
  void updateTimer(String name, String time) {
    setState(() {
      gameName = name;
      gameTime = time;
    });
  }

  void onGameDetailsEntered(
      String name, String time, List<String> selectedPlayers) {
    setState(() {
      this.selectedPlayers = selectedPlayers;
    });
  }

  void onGameDetailsEnteredForNavigation(
      String name, String time, List<String> selectedPlayers) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(
          selectedPlayers: selectedPlayers,
          onGameDetailsEntered: onGameDetailsEntered,
          onUpdateTimeDetails: (String updatedName, String updatedTime) {
            print("Updated Name: $updatedName, Updated Time: $updatedTime");
            updateTimer(updatedName, updatedTime);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RiveAppTheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 60,
            bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Bounce Fit Coach",
                style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Recent",
                style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
              ),
            ),
            ...List.generate(
              _details.length,
              (index) => Padding(
                  key: _details[index].id,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Hcard(
                    section: _details[index],
                    selectedPlayers: selectedPlayers,
                    deselect: handleDeselect,
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: selectedPlayers != null
                ? () {
                    print("The button was pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                          selectedPlayers: selectedPlayers,
                          onGameDetailsEntered:
                              onGameDetailsEnteredForNavigation,
                          onUpdateTimeDetails:
                              (String updatedName, String updatedTime) {
                            print(
                                "Updated Name: $updatedName, Updated Time: $updatedTime");
                          },
                        ),
                      ),
                    );
                  }
                : null,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 56),
        ],
      ),
    );
  }
}
