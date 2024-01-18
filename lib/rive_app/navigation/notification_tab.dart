import 'package:bounce_fit_coach/rive_app/components/noti.dart';
import 'package:flutter/material.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:bounce_fit_coach/rive_app/models/courses.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  _NotificationTabState createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RiveAppTheme.background,
      appBar: AppBar(
        title: Text('notify'),
        ),
        
        body: Column(
          
          children: [
            Noti(),
            SizedBox(height: 10,),
         Noti(),
           
          ],
          )
    );
     }
}



















































    // return  Scaffold(
    //   appBar: AppBar(
    //     title: Text('notify'),
    //   ),
    //   body: Container(
    //   constraints: const BoxConstraints(maxHeight: 110),
    //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //   decoration: BoxDecoration(
    //     color: course.color,
    //     borderRadius: BorderRadius.circular(30),
    //   ),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               section.title,
    //               style: const TextStyle(
    //                 fontSize: 24,
    //                 fontFamily: "Poppins",
    //                 color: Colors.white,
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 8,
    //             ),
    //             Text(
    //               section.caption,
    //               style:
    //                   const TextStyle(fontFamily: "Inter", color: Colors.white),
    //             )
    //           ],
    //         ),
    //       ),
    //       const Padding(
    //         padding: EdgeInsets.all(20),
    //         child: VerticalDivider(
    //           thickness: 0.8,
    //           width: 0,
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // );
 

// class SportCard extends StatelessWidget {
//   final String sport;
//   final String timing;

//   const SportCard({
//     required this.sport,
//     required this.timing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Text('data'),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 179, 178, 178),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Sport: $sport',
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Timing: $timing',
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
