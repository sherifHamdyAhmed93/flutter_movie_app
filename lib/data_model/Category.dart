class CategoryResponse {
  CategoryResponse({
    this.genres,
  });

  CategoryResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Category.fromJson(v));
      });
    }
  }

  List<Category>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.name,
    this.imagePath,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imagePath = getImagePathForCategory(name);
  }

  int? id;
  String? name;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['imagePath'] = imagePath;
    return map;
  }

  String getImagePathForCategory(String? categoryName) {
    switch (categoryName) {
      case 'Action':
        return 'assets/images/crime.jpg';
      case 'Animation':
        return 'assets/images/animation.jpg';
      case 'Adventure':
        return 'assets/images/adventure.jpg';
      case 'Family':
        return 'assets/images/family.jpg';
      case 'Fantasy':
        return 'assets/images/fantasy.jpg';
      case 'Horror':
        return 'assets/images/horror.jpg';
      case 'Music':
        return 'assets/images/music.jpg';
      case 'Romance':
        return 'assets/images/romance.jpg';
      case 'Science Fiction':
        return 'assets/images/science_fiction.jpg';
      case 'Crime':
        return 'assets/images/crime.jpg';
      case 'TV Movie':
        return 'assets/images/tv.jpg';
      case 'War':
        return 'assets/images/War.jpg';
      default:
        return 'assets/images/Mystery.jpg';
    }
  }
}
