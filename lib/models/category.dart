class Category {
  String? id;
  String? categoryName;

  Category({this.categoryName, this.id});

  Map<String, dynamic> toMap() => {
        'categoryName': categoryName,
        'id': id,
      };

  Category fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["categoryName"],
        id: json['id'],
      );
}
