enum Dietary {
  vegetarian,
  vegan,
  pescetarian,
  paleoDiet,
  forKids,
}

extension DietaryExtension on Dietary {
  String get name {
    switch (this) {
      case Dietary.vegetarian:
        return 'Vegetarian';
      case Dietary.vegan:
        return 'Vegan';
      case Dietary.pescetarian:
        return 'Pescetarian';
      case Dietary.paleoDiet:
        return 'Paleo Diet';
      case Dietary.forKids:
        return 'For Kids';
      default:
        return '';
    }
  }

  String get imagePath {
    return 'lib/assets/images/${name.toLowerCase().replaceAll(' ', '_')}.png';
  }

  String get descr {
    switch (this) {
      case Dietary.vegetarian:
        return 'No meat or fish; may include eggs and dairy if not excluded due to other filters.';
      case Dietary.vegan:
        return 'No animal products; focuses on plant-based foods.';
      case Dietary.pescetarian:
        return 'Only includes fish, no other meat.';
      case Dietary.paleoDiet:
        return 'Focuses on whole, unprocessed foods. Aims for overall health and wellness.';
      case Dietary.forKids:
        return 'What all kids typically like, Spaghetti, Nuggets and more.';
      default:
        return '';
    }
  }
}
