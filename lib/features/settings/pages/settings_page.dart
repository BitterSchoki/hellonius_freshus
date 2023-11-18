import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/food_group_selection.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/food_group.dart';

import '../../../components/joy_list_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodGroupSelectionCubit>(
      create: (context) => FoodGroupSelectionCubit(),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<FoodGroupSelectionCubit, List<FoodGroup>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
