import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Padding(
        padding:const EdgeInsets.only(left:10,right: 10,top: 3,bottom: 3),
         child: Container(
          constraints: const BoxConstraints(maxHeight: 110),
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          decoration: BoxDecoration(
            color:const Color.fromARGB(255, 174, 94, 94),
            borderRadius: BorderRadius.circular(30),
           ),
           child:const Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Baseball",
                      style:  TextStyle(
                        fontSize: 24,
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                     SizedBox(height: 8,),
                    Text(
                      "good game uk",
                      style:  TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            Padding(padding: EdgeInsets.all(20),
           child: VerticalDivider(thickness: 0.8,width: 0,),
           )
            ],
           ),
             ),
       ),
     );
  }
}





// import 'package:flutter/material.dart';

// class Noti extends StatefulWidget {
//   const Noti({Key? key}) : super(key: key);

//   @override
//   State<Noti> createState() => _NotiState();
// }

// class _NotiState extends State<Noti> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AnotherPage()),
//         );
//       },
//       child: Container(
//         constraints: const BoxConstraints(maxHeight: 110),
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Baseball",
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontFamily: "Poppins",
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     "Football",
//                     style: const TextStyle(
//                       fontFamily: "Inter",
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(20),
//               child: VerticalDivider(
//                 thickness: 0.8,
//                 width: 0,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnotherPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Another Page"),
//       ),
//       body: Center(
//         child: Text("You've navigated to another page!"),
//       ),
//     );
//   }
// }
