import 'package:flutter/material.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/favorite_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List favoriteMeal;

  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _pageIndex = 0;

  void _selectedPages(int value) {
    setState(() {
      _pageIndex = value;
    });
  }

  List _pages;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'your Favorites',
        'page': FavoriteScreen(widget.favoriteMeal),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title']),
      ),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPages,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.shifting,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "favorite",
          ),
        ],
      ),
    );
  }
}
