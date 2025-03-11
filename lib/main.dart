import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_project/l10n/app_localizations.dart';

import 'package:movies_project/provider/provider.dart';
import 'package:movies_project/screens/forget_password/forget_password.dart';
import 'package:movies_project/screens/on_boarding/on_boarding.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(context.watch<LocalProvider>().locale),
      supportedLocales: [
        Locale('en', ''), // الإنجليزية
        Locale('ar', ''), // العربية
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: Onboarding.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(
          changeLanguage: (languageCode) {
            context.read<LocalProvider>().changeLanguage(languageCode);
          },
        ),
        Onboarding.routeName: (context) => const Onboarding(),
        ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
      },
    );
  }
}
