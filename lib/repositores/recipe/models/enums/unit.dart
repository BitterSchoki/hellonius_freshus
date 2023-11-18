import 'package:json_annotation/json_annotation.dart';

enum Unit {
  @JsonValue("Grams")
  grams,
  @JsonValue("Pieces")
  pieces,
  @JsonValue("Milliliters")
  milliliters,
}
