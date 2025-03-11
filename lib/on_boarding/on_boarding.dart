import 'package:flutter/material.dart';
import 'package:movies_project/assets/app_image.dart';
import 'package:movies_project/login_screen/login_screen.dart';
import 'package:movies_project/provider/provider.dart';




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
    var appLocalizations;
    final localizations = appLocalizations.of<LocalProvider>(context)!;

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
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  data["image"]!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data["description"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (index == onboardingData.length - 1) {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routeName);
                            } else {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),

                            ),
                          ),
                          child: Text(
                            data["buttonText"]!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (index > 0) ...[
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              localizations.back,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
