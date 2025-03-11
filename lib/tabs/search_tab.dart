import 'package:flutter/material.dart';

import 'package:movies_project/ui/app_color.dart';
import 'package:movies_project/ui/app_image.dart';

import '../ui/app_icon.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<String> articles = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverAppBar(
            backgroundColor: AppColor.blackColor,
            leading: SizedBox(),
            leadingWidth: 0,
            floating: true,
            toolbarHeight: 88,
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppIcon.searchIcon),
                fillColor: AppColor.grayColor,
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.blackColor)
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.blackColor)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.blackColor)
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.blackColor)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.blackColor)
                ),

              ),
            )
        ),
        if(articles.isEmpty)
          SliverToBoxAdapter(
            child: Center(heightFactor: MediaQuery.of(context).size.height * 0.005,
              child: Image.asset(AppImage.empty,
                width: 124,
                height: 124,),
            ),
          )
      ],
    );
  }
}
