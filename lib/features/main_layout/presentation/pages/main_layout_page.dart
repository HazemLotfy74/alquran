import 'package:alquran/features/home/presentation/views/home_view.dart';
import 'package:alquran/features/quran/presentation/views/quran_view.dart';
import 'package:alquran/features/time_prayer/presentation/time_prayer_view.dart';
import 'package:alquran/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainLayoutPage extends StatefulWidget {
  final Widget? child;

  const MainLayoutPage({super.key, this.child});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  // make variable to know which page is currently selected
  int currentIndex = 0;

  // list of all pages on the app.
  final pages = const [HomeView(), TimePrayerView(), QuranView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
