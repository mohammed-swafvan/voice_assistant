import 'package:allen/presentation/utils/colors.dart';
import 'package:allen/provider/allen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AllenProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: CustomColors.whiteColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: CustomColors.whiteColor,
            )),
        home: const HomeScreen(),
      ),
    );
  }
}
