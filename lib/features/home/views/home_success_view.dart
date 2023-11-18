import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellonius_freshus/themes/colors.dart';

import '../../../components/joy_list_item.dart';
import '../pages/taste_profile_page.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: BrandColors.brand400,
              child: Padding(
                padding: const EdgeInsets.only(top: 54),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome, Hellonius",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Badge(
                        label: Text("2"),
                        child: Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JoyListItem(
                    title: "Vegan, olive hater or allergic?",
                    subtitle: "Tap to personalize your meals with\nyour taste profile",
                    imageAsset: 'lib/assets/images/user.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TasteProfilePage(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: BrandColors.brand600,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        child: Text(
                          "Manage your profiles",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Deliveries",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: BrandColors.brand100,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
