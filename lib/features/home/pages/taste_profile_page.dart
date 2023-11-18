import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/components/jox_secondary_button.dart';
import 'package:hellonius_freshus/components/joy_primary_button.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/diet_goal_selection.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/special_diet_selection.dart';
import 'package:hellonius_freshus/themes/colors.dart';

import '../bloc/cubit/food_group_selection.dart';
import '../views/taste_profile/taste_profile_food_group_view.dart';

class TasteProfilePage extends StatelessWidget {
  const TasteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

    return Material(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodGroupSelectionCubit>(
            create: (context) => FoodGroupSelectionCubit(),
          ),
          BlocProvider<DietGoalSelectionCubit>(
            create: (context) => DietGoalSelectionCubit(),
          ),
          BlocProvider<SpecialDietSelectionCubit>(
            create: (context) => SpecialDietSelectionCubit(),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _TasteProfileHeader(),
            Expanded(
              child: CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: double.maxFinite,
                ),
                items: [1, 2, 3, 4, 5].map(
                  (i) {
                    return Builder(
                      builder: (context) {
                        if (i == 1) {
                          return const TasteProfileFoodGroupView();
                        }
                        return Text(
                          'text $i',
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            _TasteProfileFooter(
              goBack: () {
                controller.previousPage();
              },
              goNext: () {
                controller.nextPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TasteProfileFooter extends StatelessWidget {
  const _TasteProfileFooter({
    required this.goBack,
    required this.goNext,
  }) : super();

  final void Function()? goBack;
  final void Function()? goNext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 14.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JoySecondaryButton(
                  title: "Back",
                  onTap: goBack,
                ),
                const SizedBox(width: 8),
                JoyPrimaryButton(
                  title: "Next",
                  onTap: goNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TasteProfileHeader extends StatelessWidget {
  const _TasteProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandColors.brand500,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text("Name"),
                      Text("Allergies"),
                      Text("Preferences"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const Text('Allergic against something special?'),
              const Text('We will replace it with something delicious?'),
            ],
          ),
        ),
      ),
    );
  }
}
