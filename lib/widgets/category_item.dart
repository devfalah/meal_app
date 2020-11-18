
import 'package:flutter/material.dart';
import 'package:meal/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color,);
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
    arguments: {
      'id':id,
      'title':title,
      'color':color,
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: ()=>selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
                begin: Alignment.topLeft,
            end:Alignment.bottomRight,
          ),
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),

      ),
    );
  }
}


