// import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
// import 'package:ecg_auth_app_heartizm/src/features/core/screens/profile_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class SelectWatchScreen extends StatefulWidget {
//   const SelectWatchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SelectWatchScreen> createState() => _SelectWatchScreenState();
// }
//
// class _SelectWatchScreenState extends State<SelectWatchScreen> {
//
//   // Widget box({width: 148.0, height: 118.0}) => Container(
//   //   width: width,
//   //   height: height,
//   //   color: HexColor("B6E4FB"),
//   // );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Image(
//
//                 image: ResizeImage(
//                   AssetImage(welcomeScreenImg),
//                   width: 284,
//                   height: 261,
//
//                 ),
//               ),
//               Text("Choose your smartwatch",
//                   style: TextStyle(fontSize: 20, color: HexColor("004679"))),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: (){},
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(16),
//                         bottomLeft: Radius.circular(16),
//                       ),
//                       child: Container(
//                         child: Image(
//                           image: AssetImage(watchImg1),
//                         ),
//                         width: 148,
//                         height: 118,
//                         color: HexColor("B6E4FB"),
//                       ),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       bottomLeft: Radius.circular(16),
//                     ),
//                     child:
//                     Container(
//                       child: Image(
//                         image: AssetImage(watchImg2),
//                       ),
//                       width: 148,
//                       height: 118,
//                       color: HexColor("B6E4FB"),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       bottomLeft: Radius.circular(16),
//                     ),
//                     child: Container(
//                       child: Image(image: AssetImage(watchImg3)),
//                       width: 148,
//                       height: 118,
//                       color: HexColor("B6E4FB"),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(16),
//                         bottomLeft: Radius.circular(16)),
//                     child: Container(
//                       child: Image(
//                         image: AssetImage(watchImg4),
//                       ),
//                       width: 148,
//                       height: 118,
//                       color: HexColor("B6E4FB"),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder:(context) =>const ProfileScreen() ));
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 37.0,
//                       width: 148,
//                       decoration: BoxDecoration(
//                           color: HexColor("004679"),
//                           borderRadius: BorderRadius.circular(11)),
//                       child: Text(
//                         "Continue   >>",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
