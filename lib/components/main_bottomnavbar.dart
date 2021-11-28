import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/assets.dart';

class MainBottomNavBar extends StatefulWidget {
  @override
  _MainBottomNavBarState createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  late int _selectedIndex;
  List pages = ['/assessment_groups', '/main_menu'];

  @override
  void initState() {
    super.initState();
    _selectedIndex = Get.currentRoute == pages[1] ? 2 : 0;
  }

  void _onItemTapped(int index) {
    bool change = false;
    setState(() {
      change = ((_selectedIndex != index) && ((_selectedIndex + index) > 1));
      _selectedIndex = index;
      if (change) {
        Get.toNamed(index < 2 ? pages[0] : pages[1]);
        _selectedIndex = 0;
      } else if (index == 2) {
        _selectedIndex = 0;
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(right: 50.0, left: 10.0),
            child: Icon(
              IconsApp.IconButtonFact_check_outlined,
              size: 30.0,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsApp.IconButtonDoorbell,
            size: 30.0,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 50.0),
            child: Icon(IconsApp.IconButtonMore_vert, size: 30.0),
          ),
          label: '',
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: AppColors.footerInactiveIcons,
      selectedItemColor: AppColors.footerActiveIcons,
      backgroundColor: AppColors.footerBG,
    );
  }
}
