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

extension DietGoalExtension on DietGoal {
  String get name {
    switch (this) {
      case DietGoal.lowCarb:
        return 'Low Carb';
      case DietGoal.highCarb:
        return 'High Carb';
      case DietGoal.highFat:
        return 'High Fat';
      case DietGoal.cleanEating:
        return 'Clean Eating';

      default:
        return '';
    }
  }

  String get descr {
    switch (this) {
      case DietGoal.lowCarb:
        return 'Reduces bread, pasta, sugar, and grains. Ideal for weight management and blood sugar control.';
      case DietGoal.highCarb:
        return 'Emphasizes carbohydrates from fruits, vegetables, and whole grains. Suitable for high-energy needs and athletic performance.';
      case DietGoal.highFat:
        return 'Increases healthy fats, like avocados, nuts, and oils. Often used for ketogenic diets and energy.';
      case DietGoal.cleanEating:
        return 'Focuses on whole, unprocessed foods. Aims for overall health and wellness.';

      default:
        return '';
    }
  }
}
