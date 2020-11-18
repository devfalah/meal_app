import 'package:flutter/material.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List favoriteMeal;

  FavoriteScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:favoriteMeal.isEmpty?BuildText():buildItem(),


    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildText(){
    return Center(
      child: Text("Favorite",),
    );
  }
  Widget buildItem(){
    return ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
          id: favoriteMeal[index].id,
          imageUrl: favoriteMeal[index].imageUrl,
          title: favoriteMeal[index].title,
          duration: favoriteMeal[index].duration,
          complexity: favoriteMeal[index].complexity,
          affordability: favoriteMeal[index].affordability,

        );
      },
      itemCount: favoriteMeal.length,
    );
  }
}
