import 'package:calorie_tracker/services/firebase_services.dart';
import 'package:calorie_tracker/view_model/food_view_model.dart';
import 'package:calorie_tracker/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class LunchPageView extends StatefulWidget {
  List foods;
  LunchPageView({super.key,required this.foods});

  @override
  State<LunchPageView> createState() => _LunchPageViewState();
}

class _LunchPageViewState extends State<LunchPageView> {
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
          "Lunch",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: widget.foods.length != 0 ? ListView.builder(
          itemCount: widget.foods.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.foods.length != 0 ? Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12)
              ),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.foods[index]["name"]),
                  Text(widget.foods[index]["calories"].toString()),
                  IconButton(onPressed: ()async{
                          showDialog(context: context, builder: (context){
                            return Center(child: CircularProgressIndicator.adaptive(),);
                          });
                            String? id = context.read<UserViewModel>().getCurrentUserId;
                                await services.deleteFood(id!, dateTime, "Lunch", widget.foods[index]["foodId"]);
                                                    await context.read<FoodViewModel>().setFoods(id, "Lunch");    
                                                        setState(()  {
                                widget.foods = context.read<FoodViewModel>().getFoodList!;
                                

                            Navigator.of(context).pop();
                            }); 
                            if (widget.foods.length != 0){ 
                                for(var i = 0;i <= widget.foods.length;i++)
                                  total = total + widget.foods[i]["calories"];
                                context.read<FoodViewModel>().setLunchCalorie(total) ;
                                  } else {
                                    context.read<FoodViewModel>().setLunchCalorie(0);
                                  }                               
                                 
                  }, icon: Icon(Icons.delete))
                ],
              ),
            ) : Text("There is no food");
          }) : Center(child: Text("There is no food!"),)
    );
  }
}
