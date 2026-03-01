import 'package:alquran/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.unselectedQuranIcon,
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            Assets.unselectedQuranIcon,
            width: 24,
            height: 24,
          ),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.unselectedPrayerIcon,
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            Assets.selectedPrayerIcon,
            width: 24,
            height: 24,
          ),
          label: "مواعيد الصلاة",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.unselectedTasbehIcon,
            width: 24,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            Assets.selectedTasbehIcon,
            width: 24,
            height: 24,
          ),
          label: "السبحة",
        ),
      ],
    );
  }
}
