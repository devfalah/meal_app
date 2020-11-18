import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color color;

  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.color,

  });
  String get complexityText{
    switch(complexity){
      case Complexity.Hard:return 'Hard';break;
      case Complexity.Simple: return 'Simple';break;
      case Complexity.Challenging:return 'Challenging';break;
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:return 'Affordable';break;
      case Affordability.Luxurious:return 'Luxurious';break;
      case Affordability.Pricey :return 'Pricey';break;
    }
  }
  void selectedMeal(BuildContext context){
    Navigator.pushNamed(context, MealDetailScreen.routeName,
    arguments: {
      'id':id,
      'color':color,
    }).then((value)  {

    });
  }
TextStyle textStyle=TextStyle(
  fontSize: 20,
);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectedMeal(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white),
                    softWrap: true,
                      overflow: TextOverflow.fade,

                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(

                    children: [
                      Icon(Icons.schedule,size: 20,),
                      SizedBox(width: 6,),
                      Text("$duration Min",style:textStyle ,),
                    ],
                  ),
                  Row(

                    children: [
                      Icon(Icons.work ,size: 20,),
                      SizedBox(width: 6,),
                      Text(complexityText,style:textStyle, ),
                    ],
                  ),
                  Row(

                    children: [
                      Icon(Icons.attach_money,size: 20,),
                      SizedBox(width: 6,),
                      Text(affordabilityText,style:textStyle ,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
