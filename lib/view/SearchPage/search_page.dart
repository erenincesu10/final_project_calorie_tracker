import 'package:calorie_tracker/models/food_model.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:calorie_tracker/view_model/food_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Services services = Services();
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Menu",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 30,
            )),
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Flexible(
                flex: 1,
                child: TextField(
                  controller: _searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.search),
                        width: 18,
                      ),
                      suffix: TextButton(
                        child: Text(
                          "Ara",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () => context
                            .read<FoodViewModel>()
                            .setFoodList(_searchController.text),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: context.watch<FoodViewModel>().getList.isEmpty
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Center(child: Text("Food not found!")))
                        : Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.all(100),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.green, Colors.blue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                border: Border.all(width: 5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${context.watch<FoodViewModel>().getList[0]!.name} (100g)"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(context
                                    .watch<FoodViewModel>()
                                    .getList[0]!
                                    .calories
                                    .toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Fat"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(context
                                            .watch<FoodViewModel>()
                                            .getList[0]!
                                            .fat_total_g
                                            .toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Protein"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(context
                                            .watch<FoodViewModel>()
                                            .getList[0]!
                                            .protein_g
                                            .toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Carbohydrate"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(context
                                            .watch<FoodViewModel>()
                                            .getList[0]!
                                            .carbohydrates_total_g
                                            .toString()),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )))),
          ],
        ),
      ),
    );
  }
}
