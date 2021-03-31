import 'package:flutter/material.dart';
import 'package:toktok/models/home_screen_models/category.dart';
import 'package:toktok/models/home_screen_models/food.dart';
import 'package:toktok/models/home_screen_models/restaurant.dart';
import 'package:toktok/src/screens/category_screen.dart';
import 'package:toktok/src/screens/restaurants/restaurant_detail.dart';
import 'package:toktok/src/widgets/food/food_add_to_cart.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP APP BAR WIDGET
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.orange),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 6, 0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "New York, United States",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                  )
                ],
              ),
            ),

            // Search and Filter Widget
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xfff1f1f1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 24,
                              color: Color(0xff707070),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    border: InputBorder.none),
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 50,
                    child: Icon(
                      Icons.filter,
                      color: Color(0xff707070),
                      size: 24,
                    ),
                    color: Color(0xfff1f1f1),
                    height: 50,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Popular Near You
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 14),
                  child: Text(
                    "Popular Near You",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                      itemCount: popularNearYouData.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: (index == popularNearYouData.length - 1)
                                  ? 20
                                  : 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RestaurantDetail(
                                        restaurant: popularNearYouData[index],
                                      )));
                            },
                            child: Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              popularNearYouData[index]
                                                  .imageUrl,
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      popularNearYouData[index].restaurantName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      popularNearYouData[index]
                                          .restaurantTypes
                                          .join(', '),
                                      style:
                                          TextStyle(color: Color(0xffa1a1a1)),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      for (var i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),

            // Categories Widget
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return CategoryScreen();
                          }));
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(color: Colors.orange, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: categoryData.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right:
                                  (index == categoryData.length - 1) ? 20 : 0),
                          child: Container(
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: categoryData[index].color),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    categoryData[index].categoryName,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff707070)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),

            // All Food Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: foodData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 100,
                        child: Row(children: [
                          Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(foodData[index].imageUrl)),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(foodData[index].foodName,
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
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                            onPressed: () {
                              foodModalBottomSheet(context, foodData[index]);
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
            )
          ],
        ));
  }
}
