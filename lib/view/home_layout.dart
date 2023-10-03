import 'package:flutter/material.dart';
import 'package:itargs_challenge/view/home/home_screen.dart';
import 'package:itargs_challenge/view/more_screen/more_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

List<Widget> screens = const [HomeScreen(), MoreScreen()];
int index = 0;

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
          ]),
    );
  }
}
