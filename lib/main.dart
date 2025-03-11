import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_project/l10n/app_localizations.dart';
import 'package:movies_project/provider/provider.dart';
import 'package:movies_project/screens/forget_password/forget_password.dart';
import 'package:movies_project/screens/home/home.dart';
import 'package:movies_project/screens/on_boarding/on_boarding.dart';
import 'package:movies_project/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalProvider(), // ✅ تأكد من تعريف الـ Provider
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(context.watch<LocalProvider>().locale),
      supportedLocales: const [
        Locale('en', ''), // الإنجليزية
        Locale('ar', ''), // العربية
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: Onboarding.routeName, // ✅ تأكد من ضبط الـ Initial Route
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(
          changeLanguage: (languageCode) {
            context.read<LocalProvider>().changeLanguage(languageCode);
          },
        ),
        Onboarding.routeName: (context) => const Onboarding(),
       HomeScreen.routeName: (context) =>  HomeScreen(), // ✅ إضافة HomeScreen للـ routes
      },
    );
  }
}
