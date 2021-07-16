import 'package:flutter/material.dart';
import 'package:toktok/models/home_screen_models/food.dart';

void foodModalBottomSheet(context, Food _foodDetails) {
  showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // Food Detial
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 100,
                          child: Row(children: [
                            Container(
                                width: 140,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(_foodDetails.imageUrl!)),
                                )),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_foodDetails.foodName!,
                                      style: TextStyle(fontSize: 18)),
                                  Row(
                                    children: [
                                      for (var i = 0; i < 5; i++)
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
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
                          ]),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // Quantity
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                MaterialButton(
                                  minWidth: 0,
                                  height: 0,
                                  padding: EdgeInsets.all(6),
                                  color: Colors.amber.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.orange,
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(fontSize: 18),
                                ),
                                MaterialButton(
                                  minWidth: 0,
                                  height: 0,
                                  padding: EdgeInsets.all(6),
                                  color: Colors.amber.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // Sizes
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                MaterialButton(
                                  minWidth: 0,
                                  height: 0,
                                  padding: EdgeInsets.all(6),
                                  color: Colors.amber.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Text(
                                      "12\"",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  minWidth: 0,
                                  height: 0,
                                  padding: EdgeInsets.all(6),
                                  color: Colors.amber.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Text(
                                      "14\"",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  minWidth: 0,
                                  height: 0,
                                  padding: EdgeInsets.all(6),
                                  color: Colors.amber.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Text(
                                      "16\"",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // Addons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Addons",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: (index == 3) ? 20 : 0),
                                    child: MaterialButton(
                                      minWidth: 0,
                                      height: 0,
                                      padding: EdgeInsets.all(6),
                                      color: Colors.amber.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      elevation: 0,
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Cheese",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "12\"",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          padding: EdgeInsets.all(6),
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
