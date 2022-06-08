class Recipes {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipes({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory Recipes.fromMap(dynamic map) {
    return Recipes(
      name: map?['name'] == null ? "" : map['name'] as String,
      images: map?['images']?[0]['hostedLargeUrl'] == null
          ? ""
          : map['images'][0]['hostedLargeUrl'] as String,
      rating: map?['rating'] == null ? 0.0 : map['rating'] as double,
      totalTime: map?['totalTime'] == null ? "" : map['totalTime'] as String,
    );
  }
  static List<Recipes> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipes.fromMap(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipes {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
