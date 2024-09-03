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
    //imagePath = getImagePathForCategory(name);
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


}