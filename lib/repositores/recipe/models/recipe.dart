import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recipe_component.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe extends Equatable {
  const Recipe(
    this.title,
    this.description,
    this.serves,
    this.recipeComponents,
    this.imagePath,
  );

  final String title;
  final String description;
  final int serves;
  @JsonKey(name: "components")
  final List<RecipeComponent> recipeComponents;

  @JsonKey(name: "image_url")
  final String? imagePath;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  @override
  List<Object?> get props => [
        title,
        description,
        serves,
        recipeComponents,
      ];
}
