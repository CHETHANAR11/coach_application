import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding:const EdgeInsets.only(left:10,right: 10,top: 3,bottom: 3),
       child: Container(
        constraints: const BoxConstraints(maxHeight: 110),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 96, 186, 122),
          borderRadius: BorderRadius.circular(30),
         ),
         child:const  Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Achivements on ...",
                    style:  TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                   SizedBox(height: 8,),
                  Text(
                    "given date",
                    style: TextStyle(
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
     );
  }
}
