// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skygoal_app/style.dart';
import 'package:iconsax/iconsax.dart';
import 'components/custom_appbar.dart';
import 'components/selectable_college.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: IndexedStack(
        index: currentScreenIndex,
        children: [
          optionsList(),
          Center(child: Text("Saved Page 1")),
          Center(child: Text("Saved Page 2")),
          Center(child: Text("Profile Page")),
        ],
      ),

//bottom nav bar to show 4 options search, saved, saved, account
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        onTap: (index) {
          setState(() {
            currentScreenIndex = index;
          });
        },
        enableFeedback: true,
        backgroundColor: Style.primaryColor,
        type: BottomNavigationBarType.fixed,
        // fixedColor: Style.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xffBBBBBB),
        unselectedLabelStyle: GoogleFonts.lato(fontSize: 10),
        selectedLabelStyle: GoogleFonts.lato(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.discover5, size: 24),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  optionsList() {
    return Center(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        shrinkWrap: true,
        children: const [
          OptionContainer(
            title: 'Top Colleges',
            subtitle:
                "Search through thousands of accredited colleges and universities online to find the right one for you.  Apply in 3 min, and connect with your future.",
            trailingText: "126 Colleges",
            assetPath: "assets/images/top_colleges.png",
          ),
          OptionContainer(
            title: 'Top Schools',
            subtitle:
                "Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.",
            trailingText: "106 Schools",
            assetPath: "assets/images/top_schools.png",
          ),
          OptionContainer(
            title: 'Exams',
            subtitle:
                "Find an end to end information about the exams that are happening in India",
            trailingText: "126 Colleges",
            assetPath: "assets/images/exams.png",
          ),
        ],
      ),
    );
  }
}


