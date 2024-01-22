import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final List<String> selectedPlayers;
  final Function(String, String) onGameDetailsEntered;

  GamePage({
    required this.selectedPlayers,
    required this.onGameDetailsEntered,
  });

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late TextEditingController _nameController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _timeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Game Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Selected Players: ${widget.selectedPlayers.join(', ')}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Game Name',   border: OutlineInputBorder(),),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Game Time',border: OutlineInputBorder(),),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onGameDetailsEntered(
                  _nameController.text,
                  _timeController.text,
                );
                 Navigator.pop(context);
              },
               style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              child: const Text('Submit', style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}