import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'HomeLayOuts/layout.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
          theme: ThemeData(primaryColor: CupertinoColors.white),
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          home: const Homepage())));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Layout());
  }
}





// import 'package:flutter/material.dart';
// import 'package:url_launcher_example/custom_button.dart';
// import 'package:url_launcher/url_launcher.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xFF3E1F92),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Get in touch',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10.0),
//                 const Text(
//                     "We'd love to hear from you. Our friendly team is always here to chat.",
//                     style: TextStyle(
//                         color: Color(0xFFA895D1),
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.normal)),
//                 const SizedBox(height: 30.0),
//                 TextButton(
//                   onPressed: () {
//                     //logic  goes here
//                   },
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(Icons.phone, color: Color(0xFFED92A2)),
//                       SizedBox(width: 20.0),
//                       Text('+0123 4567 8910',
//                           style: TextStyle(
//                               color: Color(0xFFA294C2),
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     //logic  goes here
//                   },
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(Icons.sms, color: Color(0xFFED92A2)),
//                       SizedBox(width: 20.0),
//                       Text('+0123 4567 8910',
//                           style: TextStyle(
//                               color: Color(0xFFA294C2),
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     //logic  goes here
//                   },
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(Icons.mail, color: Color(0xFFED92A2)),
//                       SizedBox(width: 20.0),
//                       Text('example@logrocket.com',
//                           style: TextStyle(
//                               color: Color(0xFFA294C2),
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     //logic  goes here
//                   },
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(Icons.location_pin, color: Color(0xFFED92A2)),
//                       SizedBox(width: 20.0),
//                       Text('87 Summer St., Boston, MA 02110',
//                           style: TextStyle(
//                               color: Color(0xFFA294C2),
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     //logic  goes here
//                   },
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(Icons.language, color: Color(0xFFED92A2)),
//                       SizedBox(width: 20.0),
//                       Text('blog.logrocket.com',
//                           style: TextStyle(
//                               color: Color(0xFFA294C2),
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }