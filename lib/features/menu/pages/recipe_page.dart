import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/jox_secondary_button.dart';
import '../../../components/joy_primary_button.dart';
import '../../../repositores/recipe/models/recipe.dart';
import '../../../themes/colors.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                recipe.imagePath != null
                    ? Image.network(recipe.imagePath!)
                    : Image.asset(
                        "lib/assets/images/risotto.png",
                      ),
                Positioned(
                  left: 16,
                  top: 48,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white54,
                      ),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: BrandColors.brand400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      recipe.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white.withOpacity(0.6),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("25 min"),
                  Text("650 Kcal"),
                  Text("Medium"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _RecipeLabel(
                        title: "Taste profiles active",
                        isActive: true,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      _RecipeLabel(
                        title: "3 ingredients",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      _RecipeLabel(
                        title: "Quick",
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      _RecipeLabel(
                        title: "Low Carb",
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      _RecipeLabel(
                        title: "Gluten Free",
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  _RecipeLabel(title: '${recipe.serves} servings')
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: BrandColors.brand100,
                ),
                child: Column(
                  children: [
                    ...recipe.recipeComponents.map(
                      (e) => e.wasReplaced
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                                vertical: 6.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: BrandColors.brand200,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 16.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Image.asset(
                                              "lib/assets/images/${e.oldIngredient?.id}.png",
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text(
                                            '${e.oldIngredient?.title} ',
                                          ),
                                          Text(
                                            'replaced with:',
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.black.withOpacity(0.6),
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Image.asset(
                                              "lib/assets/images/${e.ingredient.id}.png",
                                              width: 48,
                                              height: 48,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.ingredient.title,
                                              ),
                                              Text(
                                                '${e.amount} ${e.unit.name}',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                      color: Colors.black.withOpacity(0.6),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : e.isRemoved ?? false
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: Image.asset(
                                          "lib/assets/images/${e.ingredient.id}.png",
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        '${e.ingredient.title} ',
                                        style: const TextStyle(decoration: TextDecoration.lineThrough),
                                      ),
                                      Text(
                                        'is removed',
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              color: Colors.black.withOpacity(0.6),
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: Image.asset(
                                          "lib/assets/images/${e.ingredient.id}.png",
                                          width: 48,
                                          height: 48,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.ingredient.title,
                                          ),
                                          Text(
                                            '${e.amount} ${e.unit.name}',
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.black.withOpacity(0.6),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            //_RecipeFooter()
          ],
        ),
      ),
    );
  }
}

class _RecipeLabel extends StatelessWidget {
  const _RecipeLabel({
    required this.title,
    this.isActive = false,
  });

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isActive ? BrandColors.brand600 : BrandColors.brand200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 4.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _RecipeFooter extends StatelessWidget {
  const _RecipeFooter() : super();

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JoySecondaryButton(
                title: "Last ordered",
                onTap: () {},
              ),
              const SizedBox(width: 8),
              JoyPrimaryButton(
                title: "Add to next Box",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
