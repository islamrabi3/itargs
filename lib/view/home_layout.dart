import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:itargs_challenge/view/home/home_screen.dart';
import 'package:itargs_challenge/view/more_screen/more_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

List<Widget> screens = [
  HomeScreen(title: 'flutterTask'.tr),
  MoreScreen(title: 'moreScreen'.tr),
];
int index = 0;

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 15.0,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: 'home'.tr),
            BottomNavigationBarItem(
                icon: const Icon(Icons.more), label: 'more'.tr),
          ]),
    );
  }
}
