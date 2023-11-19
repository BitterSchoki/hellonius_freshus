enum FoodPref {
  coriander,
  olives,
  garlic,
  onions,
  coffee,
  blueCheese,
}

extension FoodPrefExtension on FoodPref {
  int get id {
    switch (this) {
      case FoodPref.coriander:
        return 27;
      case FoodPref.olives:
        return 28;
      case FoodPref.garlic:
        return 5;
      case FoodPref.onions:
        return 4;
      case FoodPref.coffee:
        return 30;
      case FoodPref.blueCheese:
        return 29;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case FoodPref.coriander:
        return 'Coriander';
      case FoodPref.olives:
        return 'Olives';
      case FoodPref.garlic:
        return 'Garlic';
      case FoodPref.onions:
        return 'Onions';
      case FoodPref.coffee:
        return 'Coffee';
      case FoodPref.blueCheese:
        return 'Blue Cheese';
      default:
        return '';
    }
  }

  String get imagePath {
    switch (this) {
      case FoodPref.coriander:
        return 'lib/assets/images/27.png';
      case FoodPref.olives:
        return 'lib/assets/images/28.png';
      case FoodPref.garlic:
        return 'lib/assets/images/5.png';
      case FoodPref.onions:
        return 'lib/assets/images/4.png';
      case FoodPref.coffee:
        return 'lib/assets/images/30.png';
      case FoodPref.blueCheese:
        return 'lib/assets/images/29.png';
      default:
        return '';
    }
  }

  String get descr {
    switch (this) {
      default:
        return 'Tap to replace';
    }
  }
}
