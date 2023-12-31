import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/food_group_selection.dart';

import '../../../../components/joy_list_item.dart';
import '../../../../repositores/recipe/models/enums/intolerances.dart';

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
              child: BlocBuilder<IntolerancesSelectionCubit, List<Intolerances>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      JoyListItem(
                        title: "No food intolerances.",
                        isSelected: state.isEmpty,
                        hasBorder: true,
                        onTap: () {
                          BlocProvider.of<IntolerancesSelectionCubit>(context).resetSelection();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 16.0,
                        ),
                        child: Text(
                          "I have intolerances against...",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      ...Intolerances.values
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
                                  BlocProvider.of<IntolerancesSelectionCubit>(context).addFoodGroup(e);
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
