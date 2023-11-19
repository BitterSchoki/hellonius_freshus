import 'package:json_annotation/json_annotation.dart';

enum Unit {
  @JsonValue("Grams")
  grams,
  @JsonValue("Pieces")
  pieces,
  @JsonValue("Milliliters")
  milliliters,
}

extension UnitExtension on Unit {
  String get nm {
    switch (this) {
      case Unit.grams:
        return 'Grams';
      case Unit.pieces:
        return 'Pieces';
      case Unit.milliliters:
        return 'Milliliters';

      default:
        return '';
    }
  }
}
