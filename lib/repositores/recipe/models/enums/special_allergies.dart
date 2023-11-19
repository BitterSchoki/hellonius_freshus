enum SpecialAllergies {
  peanuts,
  treeNuts,
  milk,
  egg,
  shellfish,
  soy,
}

extension SpecialAllergiesExtension on SpecialAllergies {
  int get id {
    switch (this) {
      case SpecialAllergies.peanuts:
        return 31;
      case SpecialAllergies.treeNuts:
        return 32;
      case SpecialAllergies.milk:
        return 18;
      case SpecialAllergies.egg:
        return 19;
      case SpecialAllergies.shellfish:
        return 20;
      case SpecialAllergies.soy:
        return 21;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case SpecialAllergies.peanuts:
        return 'Peanuts';
      case SpecialAllergies.treeNuts:
        return 'Tree Nuts';
      case SpecialAllergies.milk:
        return 'Milk';
      case SpecialAllergies.egg:
        return 'Egg';
      case SpecialAllergies.shellfish:
        return 'Shellfish';
      case SpecialAllergies.soy:
        return 'Soy';
      default:
        return '';
    }
  }

  String get imagePath {
    switch (this) {
      case SpecialAllergies.peanuts:
        return 'lib/assets/images/31.png';
      case SpecialAllergies.treeNuts:
        return 'lib/assets/images/32.png';
      case SpecialAllergies.milk:
        return 'lib/assets/images/18.png';
      case SpecialAllergies.egg:
        return 'lib/assets/images/19.png';
      case SpecialAllergies.shellfish:
        return 'lib/assets/images/20.png';
      case SpecialAllergies.soy:
        return 'lib/assets/images/21.png';
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
