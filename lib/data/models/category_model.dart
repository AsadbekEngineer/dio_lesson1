class Categori {
  int id;
  String name;
  String image;

  Categori({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Categori.fromMap(Map<String, dynamic> map) {
    return Categori(
      id: map["id"] ?? 0, // Default value should be an integer
      name: map["name"] ?? "",
      image: map["image"] ?? "", // 'image' instead of 'images'
    );
  }
}
