import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meals.dart';


  const Map<Filter, bool> kInitialFilters={
    Filter.gluttenFree:false,
    Filter.lactoseFree:false,
    Filter.vegan:false,
    Filter.vegetarian:false
  };


class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  @override
   State<TabsScreen> createState(){
    return _TabsScreenState();
   }
  
}


class _TabsScreenState extends State<TabsScreen>{
  int _selectedPageIndex=0;
  final  List<Meal> _favoriteMeals=[];

    Map<Filter, bool> _selectedFilters=kInitialFilters;


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
      final availablleMeals=dummyMeals.where((meal){
          if(_selectedFilters[Filter.gluttenFree] !&& meal.isGlutenFree){
            return false;
          }
           if(_selectedFilters[Filter.vegan]!&&!meal.isVegan){
            return false;
          }
           if(_selectedFilters[Filter.vegetarian]!&&meal.isVegetarian){
            return false;
          }
           if(_selectedFilters[Filter.lactoseFree]!&&meal.isLactoseFree){
            return false;
          }
          return true;
      } ).toList();
    Widget activePage=  CategoriesScreen( onToggleFavorite: _toggleMealFavoriteStatus,availablleMeals: availablleMeals,);

    if(_selectedPageIndex==1){
      activePage=MealsScreen(title: "Favorites", meals: _favoriteMeals,onToggleFavorite: _toggleMealFavoriteStatus,);
    }

    void _setScreen (String identifiter)async{
      Navigator.of(context).pop();
        if(identifiter.toUpperCase()=="FILTERS"){
        final result=await  Navigator.of(context).push<Map<Filter ,bool>>
        (MaterialPageRoute(builder: (ctx)=>
          FilterScreen(currentFilters:_selectedFilters)));
        setState(() {
          
         _selectedFilters=result??kInitialFilters;
        });
         
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