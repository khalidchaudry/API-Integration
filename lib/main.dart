import 'package:flutter/material.dart';

import 'ui/screens/home_screen/home_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API',
      home: HomeScreen(),
    );
  }
}
