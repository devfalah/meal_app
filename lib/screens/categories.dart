import 'package:flutter/material.dart';
import 'package:meal/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding:EdgeInsets.all(25) ,
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
      ) ,
      children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title,catData.color)).toList(),
        ),
    );
  }
}
