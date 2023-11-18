// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      json['title'] as String,
      json['description'] as String,
      json['serves'] as int,
      (json['components'] as List<dynamic>)
          .map((e) => RecipeComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'serves': instance.serves,
      'components': instance.recipeComponents,
    };
