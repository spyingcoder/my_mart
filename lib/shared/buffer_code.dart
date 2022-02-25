// import 'package:flutter/material.dart';

// class Buffer extends StatefulWidget {
//   const Buffer({ Key key }) : super(key: key);

//   @override
//   _BufferState createState() => _BufferState();
// }

// class _BufferState extends State<Buffer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [      
        
        
        
//         ////////////////////////////////////////////////////////////////////////
//         ////////////////////////////////////////////////////////////////////////
//         ///////<<------THIS WILL BE THE ANIMATION FOR INTRO SCREEN----->>///////
//         ////////////////////////////////////////////////////////////////////////
//         ////////////////////////////////////////////////////////////////////////
        
        
//            //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP--------------->>>>
//             //
//           Material(
//                 elevation: 20,
//                 //This container will act as an appbar
//                 child: Container(
//                   color: LightTheme.appBar,
//                   height: dHeight * 0.2,
//                   width: dWidth,
//                   child: Stack(
//                     children: [
//                       AnimatedPositioned(
//                         duration: const Duration(seconds: 5),
//                         curve: Curves.fastOutSlowIn,
//                         child: Center(
//                           child: SizedBox(
//                             width: dWidth * 0.80,
//                             child: FittedBox(
//                               fit: BoxFit.fitWidth,
//                               child: Row(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset(
//                                       'assets/images/appstore.png',
//                                       width: dHeight * 0.075,
//                                       height: dHeight * 0.075,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: dHeight * 0.04,
//                                   ),
//                                   Text(
//                                     "Welcome to MyMart",
//                                     style: colorizeTextStyle,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         top: selected ? dHeight * .08 : dHeight * .5,
//                         left: dWidth * 0.1,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//             //
//             //ANIMATED TEXT WHICH WILL TAKE TEXT TO THE TOP-------------->>>>
//             //,
//       ),

//     );
//   }
// }