import 'package:audread/app/explore/explore.dart';
import 'package:audread/app/home.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
        switch (index) {
          case 0:
            Get.to(
              const HomePage(),
              transition: Transition.fadeIn,
            );
            break;
          case 1:
            Get.to(
              const ExploreTopicsPage(),
              transition: Transition.fadeIn,
            );
            break;
          case 2:
            break;
          default:
        }
      }),
      items: [
        FlashyTabBarItem(
          icon: const Icon(Iconsax.stop),
          title: const Text('Home'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Icons.explore),
          title: const Text('Explore'),
        ),
        FlashyTabBarItem(
          icon: const Icon(Iconsax.d_cube_scan),
          title: const Text('AudLabs'),
        ),
      ],
    );
  }
}
