import 'package:bounce_fit_coach/rive_app/navigation/home_tab.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final List<String> selectedPlayers;
  Function(String, String, List<String>) onGameDetailsEntered;
  Function(String, String) onUpdateTimeDetails;

  GamePage({
    required this.selectedPlayers,
    required this.onGameDetailsEntered,
     required this.onUpdateTimeDetails,
  });

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late TextEditingController _nameController;
  late TextEditingController _timeController;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _timeController = TextEditingController();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: Colors.teal,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.dark(primary: Colors.teal)
                .copyWith(secondary: Colors.teal),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Enter Game Details'),
          backgroundColor: Color.fromARGB(255, 104, 141, 205)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Players: ${widget.selectedPlayers.join(', ')}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Game Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Game Time',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () => _selectTime(context),
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150, top: 10),
            child: ElevatedButton(
              onPressed: () {
                widget.onGameDetailsEntered(
                  _nameController.text,
                  _timeController.text,
                  widget.selectedPlayers,
                );
                widget.onUpdateTimeDetails(
                    _nameController.text, _timeController.text);
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(255, 91, 205, 201);
                    }
                    return Colors.greenAccent;
                  },
                ),
              ),
              child: const Text('Submit', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }
}
