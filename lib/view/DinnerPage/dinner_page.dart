import 'dart:developer';

import 'package:calorie_tracker/models/food_model.dart';
import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:calorie_tracker/view_model/food_view_model.dart';
import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class DinnerPageView extends StatefulWidget {
  List foods;
  DinnerPageView({super.key,required this.foods});

  @override
  State<DinnerPageView> createState() => _DinnerPageViewState();
}

class _DinnerPageViewState extends State<DinnerPageView> {
  double total = 0;
  Services services = Services();
  String dateTime =
      "${DateTime.now().day}_${DateTime.now().month}_${DateTime.now().year}";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dinner",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: widget.foods.length != 0 ? ListView.builder(
          itemCount: widget.foods.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.foods.length != 0 ? Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.foods[index]["name"]),
                  Text("Calorie :${widget.foods[index]["calories"].toString()}"),
                  IconButton(onPressed: () async{
                    print(widget.foods[index]["id"]);
                    String? id = context.read<UserViewModel>().getCurrentUserId;
                    await services.deleteFood(id!, dateTime, "Dinner", widget.foods[index]["foodId"]);
                                                    await context.read<FoodViewModel>().setFoods(id, "Dinner");    
                                                        setState(()  {
                                widget.foods = context.read<FoodViewModel>().getFoodList!;
                            });
                                                        if (widget.foods.length != 0){ 
                                for(var i = 0;i <= widget.foods.length;i++)
                                  total = total + widget.foods[i]["calories"];
                                context.read<FoodViewModel>().setDinnerCalorie(total) ;
                                  } else {
                                    context.read<FoodViewModel>().setDinnerCalorie(0);
                                  }         
                  }, icon: Icon(Icons.delete))
                ],
              ),
            ) : Text("There is no food!");
          }) : Center(child: Text("There is no food!"),)
    );
  }
}
