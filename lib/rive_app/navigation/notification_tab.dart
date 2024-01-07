import 'package:flutter/material.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  _NotificationTabState createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Text(
            'Appointed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SportCard(
            sport: 'Football',
            timing: '3:00 PM - 4:30 PM',
          ),
          SportCard(
            sport: 'Basketball',
            timing: '5:00 PM - 6:30 PM',
          ),
        ],
      ),
    );
  }
}

class SportCard extends StatelessWidget {
  final String sport;
  final String timing;

  const SportCard({
    required this.sport,
    required this.timing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sport: $sport',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Timing: $timing',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
