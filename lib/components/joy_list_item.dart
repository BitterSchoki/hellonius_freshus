import 'package:flutter/material.dart';
import 'package:hellonius_freshus/themes/colors.dart';

class JoyListItem extends StatelessWidget {
  const JoyListItem({
    super.key,
    required this.title,
    required this.onTap,
    this.iconData,
    this.isSelected = false,
  });

  final String title;
  final void Function() onTap;
  final IconData? iconData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: isSelected ? BrandColors.brand600 : BrandColors.brand100,
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(
            width: 2,
            color: isSelected ? BrandColors.brand500 : BrandColors.brand200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                  ),
                ],
              ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
