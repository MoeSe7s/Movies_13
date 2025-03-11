import 'package:flutter/material.dart';
import 'package:movies_project/l10n/app_localizations.dart';
import 'package:movies_project/screens/login_screen/login_screen.dart';
import 'package:movies_project/ui/app_image.dart';

class Onboarding extends StatefulWidget {
  static const routeName = "/onboarding";

  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final List<Map<String, String>> onboardingData = [
      {
        "image": AppImage.onBoard1,
        "title": localizations.findMovie,
        "description": localizations.findMovieDesc,
        "buttonText": localizations.exploreNow
      },
      {
        "image": AppImage.onBoard2,
        "title": localizations.discoverMovies,
        "description": localizations.discoverMoviesDesc,
        "buttonText": localizations.next
      },
      {
        "image": AppImage.onBoard3,
        "title": localizations.exploreGenres,
        "description": localizations.exploreGenresDesc,
        "buttonText": localizations.next
      },
      {
        "image": AppImage.onBoard4,
        "title": localizations.createWatchlist,
        "description": localizations.createWatchlistDesc,
        "buttonText": localizations.next
      },
      {
        "image": AppImage.onBoard5,
        "title": localizations.rateReview,
        "description": localizations.rateReviewDesc,
        "buttonText": localizations.next
      },
      {
        "image": AppImage.onBoard6,
        "title": localizations.startWatching,
        "description": localizations.startWatchingDesc,
        "buttonText": localizations.finish
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(data["image"]!),
              const SizedBox(height: 20),
              Text(data["title"]!,
                  style: const TextStyle(fontSize: 24, color: Colors.white)),
              const SizedBox(height: 10),
              Text(data["description"]!,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (index == onboardingData.length - 1) {
                    Navigator.pushNamed(context, LoginScreen.routeName); // ✅ الانتقال إلى تسجيل الدخول
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(data["buttonText"]!),
              ),

            ],
          );
        },
      ),
    );
  }
}
