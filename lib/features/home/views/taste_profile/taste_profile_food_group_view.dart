import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/food_group_selection.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/food_group.dart';

import '../../../../components/joy_list_item.dart';

class TasteProfileFoodGroupView extends StatelessWidget {
  const TasteProfileFoodGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<FoodGroupSelectionCubit, List<FoodGroup>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      JoyListItem(
                        title: "No food allergies",
                        isSelected: state.isEmpty,
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
                      ...FoodGroup.values
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                              ),
                              child: JoyListItem(
                                title: e.name,
                                isSelected: state.contains(e),
                                onTap: () {
                                  BlocProvider.of<FoodGroupSelectionCubit>(context).addFoodGroup(e);
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
