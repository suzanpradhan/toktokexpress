class Food {
  int? id;
  String? foodName;
  double? rating;
  String? sku;
  String? description;
  Map? menu;
  List? subtypes;
  List? addons;
  int? managerID;
  int? totalRating;
  double? priceInCents;
  String? imageUrl;

  Food(
      {this.id,
      this.foodName,
      this.managerID,
      this.description,
      this.menu,
      this.subtypes,
      this.addons,
      this.sku,
      this.imageUrl,
      this.priceInCents,
      this.rating,
      this.totalRating});

  factory Food.fromDbtoModel(Map data) {
    print(data["name"]);
    return Food(
      managerID: data['manager'],
      id: data['id'],
      foodName: data['name'],
      sku: data['sku'],
      addons: data['addons'],
      subtypes: data['subTypes'],
      description: data['description'],
      imageUrl: data['imageURL'],
      menu: data['menuCollection'],
      priceInCents: data['amountInCents'],
      rating: data['rating'] ?? 0.00,
      // totalRating: data['']);
    );
  }
}
