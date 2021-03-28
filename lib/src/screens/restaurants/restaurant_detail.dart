import 'package:flutter/material.dart';
import 'package:toktok/models/home_screen_models/food.dart';
import 'package:toktok/models/home_screen_models/restaurant.dart';
import 'package:toktok/src/widgets/food/food_add_to_cart.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetail({this.restaurant});
  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail>
    with SingleTickerProviderStateMixin {
  TabController _foodCategoryTabController;

  @override
  void initState() {
    _foodCategoryTabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  List<String> _tabs = <String>[
    "For You",
    "Pizza",
    "Burger",
    "Meals",
    "Snacks"
  ];

  List<List<Food>> _tabViews = [
    [
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
    ],
    [
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
    ],
    [
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
    ],
    [
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
    ],
    [
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
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.restaurant.imageUrl))),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
                color: Color(0xfffafafa),
                borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Restaurant Detail Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.restaurant.restaurantName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      widget.restaurant.restaurantTypes
                                          .join(", "),
                                      style: TextStyle(
                                          color: Color(0xffa1a1a1),
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.bookmark,
                                size: 28,
                                color: Colors.orange,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.green,
                              ),
                              Text(
                                "4.8 (12k ratings)",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adip iscing elit, sed do eiusmod tempor incidi luptate velit eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non , sunt ieserunt mollit anim id est laborum.",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffa1a1a1)),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Restaurant Food Section
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TabBar(
                        controller: _foodCategoryTabController,
                        labelColor: Colors.white,
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        unselectedLabelColor: Color(0xffa1a1a1),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red),
                        // indicatorSize: TabBarIndicatorSize.label,
                        physics: BouncingScrollPhysics(),
                        automaticIndicatorColorAdjustment: true,
                        isScrollable: true,
                        tabs: _tabs.map((element) => Text(element)).toList()),
                  ),

                  // FOOD SECTION
                  Expanded(
                      child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: _foodCategoryTabController,
                    children: _tabViews.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: item.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  height: 100,
                                  child: Row(children: [
                                    Container(
                                        width: 100,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  item[index].imageUrl)),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(item[index].foodName,
                                              style: TextStyle(fontSize: 16)),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "4.8 (12k ratings)",
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "\$25.00",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    MaterialButton(
                                      minWidth: 0,
                                      height: 0,
                                      padding: EdgeInsets.all(6),
                                      color: Colors.amber.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      elevation: 0,
                                      onPressed: () {
                                        foodModalBottomSheet(
                                            context, item[index]);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.orange,
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            }),
                      );
                    }).toList(),
                  ))
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
