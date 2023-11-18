import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hellonius_freshus/components/joy_primary_button.dart';
import 'package:hellonius_freshus/features/menu/bloc/recipe_bloc/recipe_event.dart';
import 'package:hellonius_freshus/repositores/recipe/models/recipe_filters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/recipe_bloc/recipe_bloc.dart';

class MenuFailureView extends StatelessWidget {
  const MenuFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'lib/assets/icons/error_egg.svg',
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Ups, da gibt\'s wohl ein Problem!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Bitte versuche es später erneut.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 85,
            ),
            child: JoyPrimaryButton(
              title: "Nochmal versuchen",
              onTap: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();

                final String? dietGoals = prefs.getString('dietGoals');
                final String? foodGroups = prefs.getString('foodGroup');
                print(dietGoals);
                print(foodGroups);

                BlocProvider.of<RecipeBloc>(context).add(
                  RecipeFetchStarted(
                    recipeFilters: const RecipeFilters(
                      keyword: "",
                      avoid: [],
                      deadly: [],
                      dietGoals: [],
                      foodGroups: [],
                      specialDiet: [],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
