import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meals.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  @override
   State<TabsScreen> createState(){
    return _TabsScreen();
   }
  
}


class _TabsScreen extends State<TabsScreen>{
  int _selectedPageIndex=0;
  final  List<Meal> _favoriteMeals=[];
  
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }


void _showInfoMessage(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context ).showSnackBar(
    SnackBar(content: 
    Text(message)
    )
  );
}
  void _toggleMealFavoriteStatus(Meal meal){
    final isExisting=_favoriteMeals.contains(meal);

    if(isExisting){
      setState(() {
      _favoriteMeals.remove(meal);
        
      });
    }
    else{
         setState(() {
      _favoriteMeals.add(meal);
      _showInfoMessage('Marked as favoirite');
        
      });
    }
  }

  @override
  Widget build(BuildContext context){

    Widget activePage=  CategoriesScreen( onToggleFavorite: _toggleMealFavoriteStatus,);

    if(_selectedPageIndex==1){
      activePage=MealsScreen(title: "Favorites", meals: _favoriteMeals,onToggleFavorite: _toggleMealFavoriteStatus,);
    }

    void _setScreen (String identifiter){
      Navigator.of(context).pop();
        if(identifiter.toUpperCase()=="FILTERS"){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const FilterScreen()));
        }else{
          //Navigator.of(context).pop();
        }
    }

    return Scaffold(
      appBar: AppBar(
        //title: ,
      ),
      drawer:  MainDrawer( onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
      
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: 
            Icon(Icons.set_meal),
            label: "Categories"
          ),
            BottomNavigationBarItem(icon: 
            Icon(Icons.star),
            label: "Favorites"
          )
        ],
      ),
    );
  }
}