import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hellonius_freshus/features/home/bloc/cubit/food_group_selection.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodGroupSelectionCubit>(
      create: (context) => FoodGroupSelectionCubit(),
      child: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
