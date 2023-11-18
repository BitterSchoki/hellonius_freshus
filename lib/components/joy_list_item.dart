import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellonius_freshus/themes/colors.dart';

class JoyListItem extends StatelessWidget {
  const JoyListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.imageAsset,
    required this.onTap,
    this.isSelected = false,
    this.hasTrailing = false,
    this.hasBorder = false,
  });

  final String title;
  final String? subtitle;
  final String? imageAsset;
  final void Function() onTap;
  final bool isSelected;
  final bool hasTrailing;
  final bool hasBorder;

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
          border: hasBorder
              ? Border.all(
                  width: 2,
                  color: isSelected ? BrandColors.brand500 : BrandColors.brand200,
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageAsset != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    imageAsset!,
                    width: 48,
                    fit: BoxFit.contain,
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: isSelected ? Colors.white : Colors.black.withOpacity(0.6),
                            ),
                      ),
                  ],
                ),
              ),
              if (isSelected)
                const Icon(
                  CupertinoIcons.check_mark,
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
