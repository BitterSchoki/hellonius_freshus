import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/food_group_selection.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/special_diet.dart';

import '../../../../components/joy_list_item.dart';
import '../../bloc/cubit/special_diet_selection.dart';

class TasteProfileSpecialDietView extends StatelessWidget {
  const TasteProfileSpecialDietView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<SpecialDietSelectionCubit, List<SpecialDiet>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      JoyListItem(
                        title: "No food allergies",
                        isSelected: state.isEmpty,
                        hasBorder: true,
                        onTap: () {
                          BlocProvider.of<FoodGroupSelectionCubit>(context).resetSelection();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 16.0,
                        ),
                        child: Text(
                          "Food groups",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      ...SpecialDiet.values
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                              ),
                              child: JoyListItem(
                                title: e.name,
                                isSelected: state.contains(e),
                                hasBorder: true,
                                onTap: () {
                                  BlocProvider.of<SpecialDietSelectionCubit>(context).addSpecialDiet(e);
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}