import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "Filters_screen";
  final Function saveFilter;
  final Map currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree ;
  bool _isVegan ;
  bool _isVegetarian ;
  bool _isLactoseFree ;
  @override
  void initState() {
    _isGlutenFree=widget.currentFilters['Gluten'];
    _isVegan=widget.currentFilters['Vegan'];
    _isVegetarian=widget.currentFilters['Vegetarian'];
    _isLactoseFree=widget.currentFilters['Lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: [
          IconButton(icon: Icon(Icons.save),onPressed:(){
            final Map <String,bool> selectedFilters={
              'Gluten': _isGlutenFree,
              'Lactose': _isLactoseFree,
              'Vegan': _isVegan,
              'Vegetarian': _isVegetarian,
            };

            widget.saveFilter(selectedFilters);
            },),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            )),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _isGlutenFree,
                  (value) {
                    setState(() {
                      _isGlutenFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _isVegan,
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _isVegetarian,
                  (value) {
                    setState(() {
                      _isVegetarian = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  _isLactoseFree,
                  (value) {
                    setState(() {
                      _isLactoseFree = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String description,
      bool currentValue, Function updateSwitch) {
    return SwitchListTile(
      activeColor: Theme.of(context).primaryColor,
      title: Text(
        title,style: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      ),
      subtitle: Text(
        description,style: TextStyle(
        fontSize: 16,
      ),
      ),
      value: currentValue,
      onChanged: updateSwitch,
    );
  }
}
