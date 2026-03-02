import 'package:alquran/features/home/presentation/views/home_view.dart';
import 'package:alquran/features/time_prayer/presentation/time_prayer_view.dart';
import 'package:alquran/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../misbaha/presentation/misbaha_view.dart';

class MainLayoutPage extends StatefulWidget {
  final Widget? child;

  const MainLayoutPage({super.key, this.child});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int currentIndex = 0;

  static const List<Widget> _pages = [
    HomeView(),
    TimePrayerView(),
    MisbahaView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
