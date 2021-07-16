import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color/random_color.dart';
import 'package:toktok/blocs/getAllCategoriesBloc/getallcategories_bloc.dart';
import 'package:toktok/models/home_screen_models/category.dart';
import 'package:toktok/utils/constants/colors.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  RandomColor _randomColor = RandomColor();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: BlocProvider.of<GetallcategoriesBloc>(context))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(color: Color(0xff0d0d0d)),
          ),
          centerTitle: true,
          backgroundColor: Color(0xfffafafa),
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xff0d0d0d),
            ),
          ),
        ),
        body: BlocConsumer<GetallcategoriesBloc, GetallcategoriesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is GetAllCategoriesLoadSuccess) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 14,
                      spacing: 14,
                      children: state.allCategoriesList
                          .map(
                            (category) => Container(
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
                                        category.icon!,
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: _randomColor
                                            .randomColor()
                                            .withOpacity(0.5)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    category.categoryName!,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff707070)),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            } else if (state is GetAllCategoriesLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: CustomColors.orangeAccent,
                  strokeWidth: 1,
                ),
              );
            } else if (state is GetAllCategoriesLoadFailed) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(
                      fontFamily: "GilroyLight",
                      fontSize: 16,
                      color: CustomColors.mediumGrey),
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
      ),
    );
  }
}
