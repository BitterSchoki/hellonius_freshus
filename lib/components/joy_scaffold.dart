import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellonius_freshus/themes/colors.dart';

class JoyScaffold extends StatelessWidget {
  const JoyScaffold({
    super.key,
    required this.child,
    required this.title,
  });

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.brand400,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 20,
            bottom: 16,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 24.0,
              top: 20,
              bottom: 18,
            ),
            child: Badge(
              label: const Text('2'),
              child: GestureDetector(
                onTap: () {
                  //OPEN NOTIFICATION
                },
                child: const Icon(
                  CupertinoIcons.bell,
                  color: CupertinoColors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: child,
    );
  }
}
