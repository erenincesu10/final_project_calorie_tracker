import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:calorie_tracker/view_model/food_view_model.dart';
import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class BreakFastPageView extends StatefulWidget {
  List foods;
  BreakFastPageView({super.key,required this.foods});

  @override
  State<BreakFastPageView> createState() => _BreakFastPageViewState();
}

class _BreakFastPageViewState extends State<BreakFastPageView> {
  double total = 0;
  String dateTime =
      "${DateTime.now().day}_${DateTime.now().month}_${DateTime.now().year}";  
  Services services = Services();
  double breakfast_total_calorie = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Breakfast",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [IconButton(onPressed: ()async{
                                      await context.read<FoodViewModel>().setFoods(context.read<UserViewModel>().getCurrentUserId!,"Breakfast");


        }, icon: Icon(Icons.download))],
      ),
      body: widget.foods.length != 0 ? ListView.builder(
          itemCount: widget.foods.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
                  Text(widget.foods[index]["calories"].toString()),
                  IconButton(onPressed: ()async{
                    String? id = context.read<UserViewModel>().getCurrentUserId;
                    await services.deleteFood(id!, dateTime, "Breakfast", widget.foods[index]["foodId"]);
                    await context.read<FoodViewModel>().setFoods(id, "Breakfast");    
                                                        setState(()  {

                                widget.foods = context.read<FoodViewModel>().getFoodList!;
                            });
                              if (widget.foods.length != 0){ 
                                for(var i = 0;i <= widget.foods.length;i++)
                                  total = total + widget.foods[i]["calories"];
                                context.read<FoodViewModel>().setBreakfastCalorie(total) ;
                                  } else {
                                    context.read<FoodViewModel>().setBreakfastCalorie(0);
                                  }         
                  }, icon: Icon(Icons.delete))
                ],
              ),
            );
          }) : Center(child: Text("There is no food!"),)
    );
  }
}
