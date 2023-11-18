import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/diet_goal_selection.dart';
import 'package:hellonius_freshus/repositores/recipe/models/enums/diet_goal.dart';

import '../../../../components/joy_list_item.dart';

class TasteProfileDietGoalsView extends StatelessWidget {
  const TasteProfileDietGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<DietGoalSelectionCubit, List<DietGoal>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      JoyListItem(
                        title: "I just eat what i want.",
                        isSelected: state.isEmpty,
                        hasBorder: true,
                        onTap: () {
                          BlocProvider.of<DietGoalSelectionCubit>(context).resetSelection();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 16.0,
                        ),
                        child: Text(
                          "Cap the carb?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      ...DietGoal.values
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                              ),
                              child: JoyListItem(
                                title: e.name,
                                subtitle: e.descr,
                                isSelected: state.contains(e),
                                hasBorder: true,
                                onTap: () {
                                  BlocProvider.of<DietGoalSelectionCubit>(context).addDietGoal(e);
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
