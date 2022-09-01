import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/utils/colors.dart';
import 'package:flutter_note_app/utils/screens.dart';
import 'package:flutter_note_app/views/screens/addNote/add_note_screen.dart';
import 'package:get/get.dart';

class NavigationTabs extends StatefulWidget {
  const NavigationTabs({Key? key}) : super(key: key);

  @override
  State<NavigationTabs> createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  int pageIndex = 0;

  void changePage(int? currentIndex) {
    setState(() {
      pageIndex = currentIndex!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,

      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: pageIndex,
        onTap: changePage,
        backgroundColor: bottomNavbarBckColor,
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        hasNotch: true,
        hasInk: true,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.dashboard_rounded,
                color: titleColor,
              ),
              activeIcon: Icon(
                Icons.dashboard_rounded,
                color: primaryColor,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.orangeAccent,
              icon: Icon(
                Icons.category_rounded,
                color: titleColor,
              ),
              activeIcon: Icon(
                Icons.category_rounded,
                color: Colors.orangeAccent,
              ),
              title: Text("Categories")),
          BubbleBottomBarItem(
              backgroundColor: Colors.lightBlue,
              icon: Icon(
                Icons.search_rounded,
                color: titleColor,
              ),
              activeIcon: Icon(
                Icons.search_rounded,
                color: Colors.lightBlue,
              ),
              title: Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.pinkAccent,
              icon: Icon(
                Icons.calendar_today_rounded,
                color: titleColor,
              ),
              activeIcon: Icon(
                Icons.calendar_today_rounded,
                color: Colors.pinkAccent,
              ),
              title: Text("Calender"))
        ],
      ),
      body: screens[pageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNoteScreen());
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
