import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/components/jox_secondary_button.dart';
import 'package:hellonius_freshus/components/joy_primary_button.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/active_selection.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/diet_goal_selection.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/recipe_filters.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/special_diet_selection.dart';
import 'package:hellonius_freshus/features/home/views/taste_profile/taste_profile_name.dart';
import 'package:hellonius_freshus/themes/colors.dart';

import '../bloc/cubit/food_group_selection.dart';
import '../views/taste_profile/taste_profile_diet_goals.dart';
import '../views/taste_profile/taste_profile_food_group_view.dart';
import '../views/taste_profile/taste_profile_special_diet_view.dart';

class TasteProfilePage extends StatelessWidget {
  const TasteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

    return Material(
      color: Colors.white,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<IntolerancesSelectionCubit>(
            create: (context) => IntolerancesSelectionCubit(),
          ),
          BlocProvider<DietGoalSelectionCubit>(
            create: (context) => DietGoalSelectionCubit(),
          ),
          BlocProvider<DietarySelectionCubit>(
            create: (context) => DietarySelectionCubit(),
          ),
          BlocProvider<ActiveSelectionCubit>(
            create: (context) => ActiveSelectionCubit(),
          ),
        ],
        child: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _TasteProfileHeader(),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      height: double.maxFinite,
                      onPageChanged: (index, _) {
                        BlocProvider.of<ActiveSelectionCubit>(context).updateSelection(index + 1);
                      }),
                  items: [1, 2, 3, 4, 5, 6].map(
                    (i) {
                      return Builder(
                        builder: (context) {
                          if (i == 1) {
                            return const TasteProfileName();
                          } else if (i == 2) {
                            return const TasteProfileFoodGroupView();
                          } else if (i == 3) {
                            return const TasteProfileSpecialDietView();
                          } else if (i == 4) {
                            return const TasteProfileSpecialDietView();
                          } else if (i == 5) {
                            return const TasteProfileDietGoalsView();
                          } else if (i == 6) {
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
    return Column(
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
            bottom: 48,
          ),
          child: BlocBuilder<ActiveSelectionCubit, int>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JoySecondaryButton(
                    title: "Back",
                    onTap: state != 0 ? goBack : null,
                  ),
                  const SizedBox(width: 8),
                  JoyPrimaryButton(
                    title: state == 6 ? "Finish" : "Next",
                    onTap: state == 6
                        ? () {
                            final dietGoalSelection = BlocProvider.of<DietGoalSelectionCubit>(context).state;
                            final foodGroupSelection = BlocProvider.of<IntolerancesSelectionCubit>(context).state;
                            final specialDietSelection = BlocProvider.of<DietarySelectionCubit>(context).state;

                            BlocProvider.of<RecipeFiltersCubit>(context).addFilters(
                              avoid: [],
                              deadly: [],
                              dietGoals: dietGoalSelection,
                              foodGroups: foodGroupSelection,
                              specialDiets: specialDietSelection,
                            );

                            Navigator.of(context).pop();
                          }
                        : goNext,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TasteProfileHeader extends StatelessWidget {
  const _TasteProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BrandColors.brand400,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<ActiveSelectionCubit, int>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _TasteProfileHeaderStep1(
                            name: "Name",
                            activeStep: state,
                          ),
                          _TasteProfileHeaderStep2(
                            name: "Allergies",
                            activeStep: state,
                          ),
                          _TasteProfileHeaderStep3(name: "Preferences", activeStep: state),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    _getTitle(state),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    _getSubtitle(state),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white.withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _getSubtitle(int state) {
    switch (state) {
      case 1:
        return 'Enter your Name';
      case 2:
        return 'No worries, we got you covered.';
      case 3:
        return 'We will replace it with something delicious.';
      case 4:
        return 'We respect all choices.';
      case 5:
        return 'Hand in hand to food fulfillment';
      case 6:
        return 'Choose ingredient you want to be replaced.';
      default:
        return '';
    }
  }

  String _getTitle(int state) {
    switch (state) {
      case 1:
        return 'Creating Taste Profile for...';
      case 2:
        return 'Any food intolerances?';
      case 3:
        return 'Special allergies?';
      case 4:
        return 'No meat, no problem!';
      case 5:
        return 'Your food goals.';
      case 6:
        return 'Like eww, who likes that?';
      default:
        return '';
    }
  }
}

class _TasteProfileHeaderStep1 extends StatelessWidget {
  const _TasteProfileHeaderStep1({
    required this.name,
    required this.activeStep,
  });

  final String name;
  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: [1].contains(activeStep) ? Colors.white : Colors.white.withOpacity(0.6),
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeStep == 1 ? Colors.white : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TasteProfileHeaderStep2 extends StatelessWidget {
  const _TasteProfileHeaderStep2({
    required this.name,
    required this.activeStep,
  });

  final String name;
  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: [2, 3].contains(activeStep) ? Colors.white : Colors.white.withOpacity(0.6),
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeStep == 2 ? Colors.white : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeStep == 3 ? Colors.white : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TasteProfileHeaderStep3 extends StatelessWidget {
  const _TasteProfileHeaderStep3({
    required this.name,
    required this.activeStep,
  });

  final String name;
  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: [4, 5, 6].contains(activeStep) ? Colors.white : Colors.white.withOpacity(0.6),
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeStep == 4 ? Colors.white : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeStep == 5 ? Colors.white : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: activeStep == 6 ? Colors.white : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
