import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'package:meal/models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  static String routeName = "Meal_detail";

final Function toggleFavorite;
  final Function isFavorite;


  MealDetailScreen(this.isFavorite,this.toggleFavorite);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
   final meal = ModalRoute.of(context).settings.arguments as Map;
    final mealId = meal['id'];
    final color = meal['color'];
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetail.title,
        ),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(mealDetail.imageUrl),
            ),
            buildTitle(context,"Ingredients"),
            buildContainer(color: color,child: ListView.builder(
              itemBuilder: (context, index) => Card(
                color: color,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Text(
                    mealDetail.ingredients[index],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              itemCount: mealDetail.ingredients.length,
            ), ),
            buildTitle(context,"Steps"),
            buildContainer(color: color,child: ListView.builder(
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child:ListTile(
                    title:  Text(
                      mealDetail.steps[index],
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: color,

                      child: Text("${index+1}",style: TextStyle(color: Colors.white),

                      ),
                    ),
                  )
                ),
              ),
              itemCount: mealDetail.steps.length,
            ), ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(widget.isFavorite(mealId)?Icons.star:Icons.star_border
        ),
        onPressed:(){
          setState(() {
            widget.isFavorite(mealId);
          });
          widget.toggleFavorite(mealId);},
      ),
    );
  }

  Container buildContainer({color, Widget child}) {
    return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          width: 300,
          height: 150,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: child,
        );
  }

  Container buildTitle(BuildContext context,text) {
    return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.title,
          ),
        );
  }
}
