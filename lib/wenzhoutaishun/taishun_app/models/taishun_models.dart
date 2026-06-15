class Attraction {
  final int id;
  final String nameZh;
  final String nameKo;
  final String shortDescZh;
  final String shortDescKo;
  final String fullDescZh;
  final String fullDescKo;
  final String categoryZh;
  final String categoryKo;
  final String imageName;

  Attraction({
    required this.id,
    required this.nameZh,
    required this.nameKo,
    required this.shortDescZh,
    required this.shortDescKo,
    required this.fullDescZh,
    required this.fullDescKo,
    required this.categoryZh,
    required this.categoryKo,
    required this.imageName,
  });
}

class FoodItem {
  final int id;
  final String nameZh;
  final String nameKo;
  final String descriptionZh;
  final String descriptionKo;
  final String tagZh;
  final String tagKo;
  final String imageName;

  FoodItem({
    required this.id,
    required this.nameZh,
    required this.nameKo,
    required this.descriptionZh,
    required this.descriptionKo,
    required this.tagZh,
    required this.tagKo,
    required this.imageName,
  });
}

class RouteItem {
  final int id;
  final String titleZh;
  final String titleKo;
  final List<RouteDay> days;

  RouteItem({required this.id, required this.titleZh, required this.titleKo, required this.days});
}

class RouteDay {
  final int dayNumber;
  final String descriptionZh;
  final String descriptionKo;
  final List<String> highlightsZh;
  final List<String> highlightsKo;

  RouteDay({
    required this.dayNumber,
    required this.descriptionZh,
    required this.descriptionKo,
    required this.highlightsZh,
    required this.highlightsKo,
  });
}