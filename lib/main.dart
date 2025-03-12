import 'package:flutter/material.dart';
import 'package:movies_project/forget_password/forget_password.dart';
import 'package:movies_project/login_screen/login_screen.dart';
import 'package:movies_project/on_boarding/on_boarding.dart';
import 'package:movies_project/screens/home_screen/home_screen.dart';
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

  static const String routeName = "/home"; // ✅ أضف هذا لو مش موجود


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(context.watch<LocalProvider>().locale ?? 'en', 'ar'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreen.routeName, // تغيير الشاشة الابتدائية للهوم
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(), // إضافة الهوم للشاشات المسجلة
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
