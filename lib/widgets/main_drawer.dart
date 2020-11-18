import 'package:flutter/material.dart';
import 'package:meal/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!",style: Theme.of(context).textTheme.title),
          ),
          buildListTile(context,"Meals",Icons.restaurant,(){Navigator.pushReplacementNamed(context, '/');}),
          buildListTile(context,"Filters",Icons.settings,(){Navigator.pushReplacementNamed(context, FiltersScreen.routeName);}),

        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context,String title,IconData icon,Function onTap) {
    return ListTile(
          leading:Icon(icon,size: 24,),
          title: Text(title,style: Theme.of(context).textTheme.body1),
      onTap: onTap,

        );
  }
}
