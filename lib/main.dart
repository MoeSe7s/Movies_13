import 'package:flutter/material.dart';
import 'package:movies_project/forget_password/forget_password.dart';
import 'package:movies_project/login_screen/login_screen.dart';
import 'package:movies_project/on_boarding/on_boarding.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(context.watch<LocalProvider>().locale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(
          changeLanguage: (languageCode) {
            context.read<LocalProvider>().changeLanguage(languageCode);
          },
        ),
        Onboarding.routeName: (context) => const Onboarding(),
        ForgetPasswordScreen.routeName: (context) =>
        const ForgetPasswordScreen(),
      },
    );
  }
}