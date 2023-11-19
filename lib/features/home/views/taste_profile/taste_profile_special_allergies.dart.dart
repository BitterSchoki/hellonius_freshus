import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/speical_allergies_cubit.dart';

import '../../../../components/joy_list_item.dart';
import '../../../../repositores/recipe/models/enums/special_allergies.dart';

class TasteProfileSpecialAllergiesView extends StatelessWidget {
  const TasteProfileSpecialAllergiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<SpecialAllergiesCubit, List<SpecialAllergies>>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      JoyListItem(
                        title: "No food allergies.",
                        isSelected: state.isEmpty,
                        hasBorder: true,
                        onTap: () {
                          BlocProvider.of<SpecialAllergiesCubit>(context).resetSelection();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                          bottom: 16.0,
                        ),
                        child: Text(
                          "Im allergic agaist...",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      ...SpecialAllergies.values
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
                                  BlocProvider.of<SpecialAllergiesCubit>(context).addFoodPref(e);
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
