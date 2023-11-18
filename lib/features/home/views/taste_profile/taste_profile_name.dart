import 'package:flutter/material.dart';

class TasteProfileName extends StatelessWidget {
  const TasteProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 24,
                color: Colors.black,
              ),
          cursorHeight: 32,
          controller: controller,
          maxLength: 16,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Name',
            hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 24,
                  color: Colors.black.withOpacity(0.4),
                ),
            counterText: "",
          ),
          cursorWidth: 4,
        ),
      ),
    );
  }
}
