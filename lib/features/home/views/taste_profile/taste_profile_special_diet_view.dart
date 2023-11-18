import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/joy_list_item.dart';
import '../../../../repositores/recipe/models/enums/dietary.dart';
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
              child: BlocBuilder<DietarySelectionCubit, List<Dietary>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      JoyListItem(
                        title: "I eat everything.",
                        isSelected: state.isEmpty,
                        hasBorder: true,
                        onTap: () {
                          BlocProvider.of<DietarySelectionCubit>(context).resetSelection();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 16.0,
                        ),
                        child: Text(
                          "Further dietary option",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      ...Dietary.values
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8.0,
                              ),
                              child: JoyListItem(
                                title: e.name,
                                subtitle: e.descr,
                                imageAsset: e.imagePath,
                                isSelected: state.contains(e),
                                hasBorder: true,
                                onTap: () {
                                  BlocProvider.of<DietarySelectionCubit>(context).addSpecialDiet(e);
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
