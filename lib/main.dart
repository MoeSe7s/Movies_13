import 'package:flutter/material.dart';
import 'package:movies_project/on_boarding/on_boarding.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>LocalProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Onboarding.routeName,
      routes: {
        Onboarding.routeName:(context)=> Onboarding(),
        HomeScreen.routeName:(context)=> HomeScreen()
      },
    );
  }
}
