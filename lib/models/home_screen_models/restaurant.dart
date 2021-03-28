class Restaurant {
  int index;
  String restaurantName;
  String imageUrl;
  List<String> restaurantTypes;
  int rating;

  Restaurant(
      {this.index,
      this.restaurantName,
      this.imageUrl,
      this.restaurantTypes,
      this.rating});
}

List<Restaurant> popularNearYouData = <Restaurant>[
  Restaurant(
      index: 1,
      imageUrl:
          "https://nepalecoadventure.com/wp-content/uploads/2018/07/Restaurant-and-Accommodation-in-Kathmandu-1.jpg",
      restaurantName: "Mc Donald's Thai Food",
      restaurantTypes: ["Western Cuisine", "Fast Food", "Burger"],
      rating: 4),
  Restaurant(
      index: 1,
      imageUrl:
          "https://nepalecoadventure.com/wp-content/uploads/2018/07/Restaurant-and-Accommodation-in-Kathmandu-1.jpg",
      restaurantName: "Mc Donald",
      restaurantTypes: ["Western Cuisine", "Fast Food", "Burger"],
      rating: 4),
  Restaurant(
      index: 1,
      imageUrl:
          "https://nepalecoadventure.com/wp-content/uploads/2018/07/Restaurant-and-Accommodation-in-Kathmandu-1.jpg",
      restaurantName: "Mc Donald",
      restaurantTypes: ["Western Cuisine", "Fast Food", "Burger"],
      rating: 4),
];
