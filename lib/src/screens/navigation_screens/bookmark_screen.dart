import 'package:flutter/material.dart';
import 'package:toktok/models/home_screen_models/restaurant.dart';
import 'package:toktok/src/screens/restaurants/restaurant_detail.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Color(0xfffafafa),
          title: Text(
            "Bookmark",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff0d0d0d)),
          ),
          centerTitle: true,
        ),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: popularNearYouData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return RestaurantDetail(
                          restaurant: popularNearYouData[index],
                        );
                      }));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        popularNearYouData[index].imageUrl!))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      popularNearYouData[index].restaurantName!,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          "4.8 (12k ratings)",
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$25.00",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
