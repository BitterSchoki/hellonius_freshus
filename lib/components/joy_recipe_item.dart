import 'package:flutter/material.dart';
import 'package:hellonius_freshus/features/menu/pages/recipe_page.dart';

import '../repositores/recipe/models/recipe.dart';

class JoyRecipeItem extends StatelessWidget {
  const JoyRecipeItem({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipePage(
              recipe: recipe,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 175,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: recipe.imagePath != null
                    ? DecorationImage(
                        image: NetworkImage(
                          recipe.imagePath!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: ExactAssetImage("lib/assets/images/risotto.png"),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    recipe.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
