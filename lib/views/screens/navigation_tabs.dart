import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/screens.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationTabs extends StatefulWidget {
  const NavigationTabs({Key? key}) : super(key: key);

  @override
  State<NavigationTabs> createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        color: Colors.black.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 26,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 1000),
            tabBackgroundColor: Colors.black,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.star_border,
                text: 'Starred',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.note_add_rounded,
                text: 'New note',
              ),
            ],
            selectedIndex: pageIndex,
            onTabChange: (index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
      ),
      body: screens[pageIndex],
    );
  }
}
