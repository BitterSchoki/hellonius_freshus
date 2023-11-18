import 'package:json_annotation/json_annotation.dart';

enum DietGoal {
  @JsonValue("LowCarb")
  lowCarb,
  @JsonValue("HighCarb")
  highCarb,
  @JsonValue("HighFat")
  highFat,
  @JsonValue("CleanEating")
  cleanEating,
}
