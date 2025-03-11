import 'package:flutter/material.dart';
import 'package:movies_project/l10n/app_localizations.dart';
import 'package:movies_project/screens/home/home.dart';
import 'package:movies_project/ui/app_image.dart';

class LoginScreen extends StatefulWidget {
  final Function(String) changeLanguage;
  static const routeName = "/LoginScreen";

  const LoginScreen({Key? key, required this.changeLanguage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  String selectedLanguage = "ar";

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Image.asset(AppImage.loginImage,
                  height: MediaQuery.of(context).size.height * 0.2),
              const SizedBox(height: 24),

              /// 🟢 حقل البريد الإلكتروني
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                  hintText: localizations.emailHint,
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              /// 🟢 زر تسجيل الدخول
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName); // ✅ الانتقال إلى الصفحة الرئيسية
                  },
                  child: Text(
                    localizations.login,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
