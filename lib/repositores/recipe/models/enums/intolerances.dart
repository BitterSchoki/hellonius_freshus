import 'package:json_annotation/json_annotation.dart';

enum Intolerances {
  @JsonValue("Lactose")
  lactose,
  @JsonValue("Gluten")
  gluten,
  @JsonValue("Histamines")
  histamines,
  @JsonValue("Seafood")
  seafood,
}

extension IntolerancesExtension on Intolerances {
  String get name {
    switch (this) {
      case Intolerances.lactose:
        return 'Lactose';
      case Intolerances.gluten:
        return 'Gluten';
      case Intolerances.histamines:
        return 'Histamines';
      case Intolerances.seafood:
        return 'Seafood';
      default:
        return '';
    }
  }

  String get descr {
    switch (this) {
      case Intolerances.lactose:
        return 'Excludes milk, cheese, and other dairy products.';
      case Intolerances.gluten:
        return 'Omits wheat, barley, rye, and derivatives.';
      case Intolerances.histamines:
        return 'Avoids aged cheeses, cured meats, fermented foods, and certain vegetables.';
      case Intolerances.seafood:
        return 'Excludes fish, shellfish, and other marine foods.';
      default:
        return '';
    }
  }
}
