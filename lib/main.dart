import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellonius_freshus/features/home/pages/home_page.dart';
import 'package:hellonius_freshus/features/menu/pages/menu_page.dart';
import 'package:hellonius_freshus/features/settings/pages/settings_page.dart';
import 'package:hellonius_freshus/themes/colors.dart';
import 'package:hellonius_freshus/themes/texts.dart';

import 'themes/color_themes.dart';

void main() {
  runApp(const HelloniusFreshus());
}

class HelloniusFreshus extends StatelessWidget {
  const HelloniusFreshus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: customTextTheme,
        colorScheme: customColorScheme,
      ),
      title: 'Hellonius Freshus',
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Colors.white,
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white.withOpacity(
          0.8,
        ),
        activeColor: BrandColors.brand600,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house,
              size: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.forklift,
              size: 24,
            ),
            label: "My Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.gear,
              size: 24,
            ),
            label: "Settings",
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const HomePage();
        }
        if (index == 1) {
          return const MenuPage();
        }

        if (index == 2) {
          return const SettingsPage();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
