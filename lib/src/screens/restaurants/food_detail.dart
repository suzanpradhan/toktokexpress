import 'package:flutter/material.dart';
import 'package:toktok/models/home_screen_models/food.dart';

class FoodDetailScreen extends StatefulWidget {
  final Food food;
  const FoodDetailScreen({required this.food, Key? key}) : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 260,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.food.imageUrl!))),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: 240),
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
                                      widget.food.foodName ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (widget.food.menu != null)
                                        ? Text(
                                            widget.food.menu!['name'],
                                            style: TextStyle(
                                                color: Color(0xffa1a1a1),
                                                fontSize: 16),
                                          )
                                        : Container()
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
                            widget.food.description ?? "No Description",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffa1a1a1)),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Restaurant Food Section
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: TabBar(
                  //       controller: _foodCategoryTabController,
                  //       labelColor: Colors.white,
                  //       labelPadding:
                  //           EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  //       labelStyle: TextStyle(
                  //         fontSize: 16,
                  //       ),
                  //       unselectedLabelColor: Color(0xffa1a1a1),
                  //       indicator: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8),
                  //           color: Colors.red),
                  //       // indicatorSize: TabBarIndicatorSize.label,
                  //       physics: BouncingScrollPhysics(),
                  //       automaticIndicatorColorAdjustment: true,
                  //       isScrollable: true,
                  //       tabs: _tabs.map((element) => Text(element)).toList()),
                  // ),

                  // FOOD SECTION
                  // Expanded(
                  //     child: TabBarView(
                  //   physics: BouncingScrollPhysics(),
                  //   controller: _foodCategoryTabController,
                  //   children: _tabViews.map((item) {
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: NeverScrollableScrollPhysics(),
                  //           itemCount: item.length,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return Padding(
                  //               padding:
                  //                   const EdgeInsets.symmetric(vertical: 10),
                  //               child: Container(
                  //                 height: 100,
                  //                 child: Row(children: [
                  //                   Container(
                  //                       width: 100,
                  //                       height: 80,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                         image: DecorationImage(
                  //                             fit: BoxFit.cover,
                  //                             image: NetworkImage(
                  //                                 item[index].imageUrl!)),
                  //                       )),
                  //                   SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   Expanded(
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         Text(item[index].foodName!,
                  //                             style: TextStyle(fontSize: 16)),
                  //                         Row(
                  //                           children: [
                  //                             Icon(
                  //                               Icons.star,
                  //                               color: Colors.green,
                  //                             ),
                  //                             Text(
                  //                               "4.8 (12k ratings)",
                  //                               overflow: TextOverflow.ellipsis,
                  //                             )
                  //                           ],
                  //                         ),
                  //                         SizedBox(
                  //                           height: 8,
                  //                         ),
                  //                         Text(
                  //                           "\$25.00",
                  //                           style: TextStyle(
                  //                               fontSize: 20,
                  //                               fontWeight: FontWeight.bold),
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   MaterialButton(
                  //                     minWidth: 0,
                  //                     height: 0,
                  //                     padding: EdgeInsets.all(6),
                  //                     color: Colors.amber.withOpacity(0.5),
                  //                     shape: RoundedRectangleBorder(
                  //                         borderRadius:
                  //                             BorderRadius.circular(8)),
                  //                     elevation: 0,
                  //                     onPressed: () {
                  //                       foodModalBottomSheet(
                  //                           context, item[index]);
                  //                     },
                  //                     child: Icon(
                  //                       Icons.add,
                  //                       color: Colors.orange,
                  //                     ),
                  //                   )
                  //                 ]),
                  //               ),
                  //             );
                  //           }),
                  //     );
                  //   }).toList(),
                  // ))
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 20,
            ),
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
