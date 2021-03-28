class Food {
  String foodName;
  double rating;
  int totalRating;
  int priceInCents;
  String imageUrl;

  Food(
      {this.foodName,
      this.imageUrl,
      this.priceInCents,
      this.rating,
      this.totalRating});
}

List<Food> foodData = <Food>[
  Food(
      foodName: "Thai Food",
      imageUrl:
          "https://www.helpguide.org/wp-content/uploads/fast-foods-candy-cookies-pastries-768.jpg",
      priceInCents: 1200,
      rating: 4.8,
      totalRating: 1500),
  Food(
      foodName: "Thai Food",
      imageUrl:
          "https://www.helpguide.org/wp-content/uploads/fast-foods-candy-cookies-pastries-768.jpg",
      priceInCents: 1200,
      rating: 4.8,
      totalRating: 1500),
  Food(
      foodName: "Thai Food",
      imageUrl:
          "https://www.helpguide.org/wp-content/uploads/fast-foods-candy-cookies-pastries-768.jpg",
      priceInCents: 1200,
      rating: 4.8,
      totalRating: 1500),
  Food(
      foodName: "Thai Food",
      imageUrl:
          "https://www.helpguide.org/wp-content/uploads/fast-foods-candy-cookies-pastries-768.jpg",
      priceInCents: 1200,
      rating: 4.8,
      totalRating: 1500),
];
