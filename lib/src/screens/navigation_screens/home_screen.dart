import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color/random_color.dart';
import 'package:toktok/blocs/getAllCategoriesBloc/getallcategories_bloc.dart';
import 'package:toktok/blocs/getAllFoodsBloc/getallfoods_bloc.dart';
import 'package:toktok/models/home_screen_models/category.dart';
import 'package:toktok/models/home_screen_models/food.dart';
import 'package:toktok/models/home_screen_models/restaurant.dart';
import 'package:toktok/src/screens/category_screen.dart';
import 'package:toktok/src/screens/restaurants/food_detail.dart';
import 'package:toktok/src/screens/restaurants/restaurant_detail.dart';
import 'package:toktok/src/widgets/food/food_add_to_cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:toktok/utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomColor _randomColor = RandomColor();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  GetallfoodsBloc()..add(RequestGetAllFoods())),
          BlocProvider(
              create: (context) =>
                  GetallcategoriesBloc()..add(RequestGetAllCategories())),
        ],
        child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 40),
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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
                                  right:
                                      (index == popularNearYouData.length - 1)
                                          ? 20
                                          : 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RestaurantDetail(
                                            restaurant:
                                                popularNearYouData[index],
                                          )));
                                },
                                child: Container(
                                  width: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  popularNearYouData[index]
                                                      .imageUrl!,
                                                ))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          popularNearYouData[index]
                                              .restaurantName!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          popularNearYouData[index]
                                              .restaurantTypes!
                                              .join(', '),
                                          style: TextStyle(
                                              color: Color(0xffa1a1a1)),
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
                BlocConsumer<GetallcategoriesBloc, GetallcategoriesState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is GetAllCategoriesLoadSuccess) {
                      return Column(
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
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return BlocProvider.value(
                                        value: BlocProvider.of<
                                            GetallcategoriesBloc>(context),
                                        child: CategoryScreen(),
                                      );
                                    }));
                                  },
                                  child: Text(
                                    "See all",
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                                itemCount:
                                    state.allCategoriesList.take(6).length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  if (state.allCategoriesList[index].icon !=
                                          null &&
                                      state.allCategoriesList[index].icon !=
                                          "") {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: (index ==
                                                  state.allCategoriesList
                                                          .take(6)
                                                          .length -
                                                      1)
                                              ? 20
                                              : 0),
                                      child: Container(
                                        width: 100,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              child: Center(
                                                  child: Container(
                                                width: 58,
                                                height: 58,
                                                child: Image.network(
                                                  state.allCategoriesList[index]
                                                      .icon!,
                                                  fit: BoxFit.contain,
                                                ),
                                              )),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: _randomColor
                                                      .randomColor()
                                                      .withOpacity(0.5)),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Expanded(
                                              child: Text(
                                                state.allCategoriesList[index]
                                                        .categoryName ??
                                                    "",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff707070)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                          ),
                        ],
                      );
                    } else if (state is GetAllCategoriesLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.mediumGrey,
                          strokeWidth: 1,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),

                // All Food Widget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocConsumer<GetallfoodsBloc, GetallfoodsState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is GetAllFoodsSuccess) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.allFoods.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(14),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) {
                                      return FoodDetailScreen(
                                        food: state.allFoods[index],
                                      );
                                    }));
                                  },
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
                                                image: (state.allFoods[index]
                                                            .imageUrl !=
                                                        null
                                                    ? NetworkImage(state
                                                        .allFoods[index]
                                                        .imageUrl!)
                                                    : AssetImage(
                                                            "assets/images/not-found.png")
                                                        as ImageProvider),
                                              ))),
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
                                            Text(
                                                state.allFoods[index]
                                                        .foodName ??
                                                    "",
                                                style: TextStyle(fontSize: 16)),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.green,
                                                ),
                                                Text(
                                                  "4.8 (12k ratings)",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "\$ ${(state.allFoods[index].priceInCents ?? 0) / 100}",
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
                                              context, state.allFoods[index]);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.orange,
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              );
                            });
                      } else if (state is GetAllFoodsFailed) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(
                                fontFamily: "GilroyLight",
                                fontSize: 16,
                                color: CustomColors.mediumGrey),
                          ),
                        );
                      } else if (state is GetAllFoodLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.orangeAccent,
                            strokeWidth: 1,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.orangeAccent,
                            strokeWidth: 1,
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            )));
  }
}
