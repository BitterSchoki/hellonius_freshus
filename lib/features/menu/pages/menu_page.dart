import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/menu/views/menu_failure_view.dart';
import 'package:hellonius_freshus/features/menu/views/menu_loading_view.dart';
import 'package:hellonius_freshus/features/menu/views/menu_success_view.dart';
import 'package:hellonius_freshus/repositores/recipe/api/recipe_api_client.dart';
import 'package:hellonius_freshus/repositores/recipe_repository.dart';

import '../bloc/recipe_bloc/recipe_bloc.dart';
import '../bloc/recipe_bloc/recipe_state.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider<RecipeBloc>(
        create: (context) => RecipeBloc(
          repository: ConnectedRecipeRepository(
            recipeApiClient: const RecipeApiClient(),
          ),
        ),
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoadInProgress) {
              return const MenuLoadingView();
            } else if (state is RecipeLoadSuccess) {
              return MenuSuccessView(
                recipes: state.recipes,
              );
            }
            return const MenuFailureView();
          },
        ),
      ),
    );
  }
}
