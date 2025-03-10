import 'package:flutter/material.dart';
import 'package:movies_project/assets/app_color.dart';
import 'package:movies_project/assets/app_icon.dart';
import 'package:movies_project/tabs/browse_tab.dart';
import 'package:movies_project/tabs/home_tab.dart';
import 'package:movies_project/tabs/profile_tab.dart';
import 'package:movies_project/tabs/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;


  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: AppColor.blackColor,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                  selectedItemColor: AppColor.yellow,
                  unselectedItemColor: AppColor.whiteColor,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {
                    });
                  },
                  backgroundColor: AppColor.grayColor,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(index: 0, imageName: AppIcon.homeIcon),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(index: 1, imageName: AppIcon.searchIcon),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(index: 2, imageName: AppIcon.exploreIcon),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(index: 3, imageName: AppIcon.profileIcon),
                        label: ""),
              
                  ]),
            ),
          ),
          body: tabs[selectedIndex],
        );
  }
  Widget builtItemInBottomNavBar({required int index, required String imageName}) {
    return selectedIndex == index ?
    ImageIcon(AssetImage(imageName)) :
    ImageIcon(AssetImage(imageName));
  }
}

