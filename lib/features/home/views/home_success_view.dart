import 'package:flutter/material.dart';
import 'package:hellonius_freshus/components/jox_secondary_button.dart';

import '../pages/taste_profile_page.dart';

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return JoySecondaryButton(
      title: "test",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TasteProfilePage(),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
