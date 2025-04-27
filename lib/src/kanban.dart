import 'package:flutter/material.dart';

class Kanban extends StatelessWidget {
  const Kanban({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

    home: Scaffold(
      body: Column(
        children: [
          Text("data")
        ],
      ),
    ),

    );
  }
}


// Widget _flavorBanner({required Widget child, bool show = true}) =>
//     show
//         ? Banner(
//           location: BannerLocation.topStart,
//           message: F.name,
//           color: Colors.green.withAlpha(150),
//           textStyle: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 12.0,
//             letterSpacing: 1.0,
//           ),
//           textDirection: TextDirection.ltr,
//           child: child,
//         )
//         : Container(child: child);
