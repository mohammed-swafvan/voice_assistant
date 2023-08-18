import 'package:allen/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: CustomColors.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.whiteColor,
        )
      ),
      home: const HomeScreen(),
    );
  }
}
