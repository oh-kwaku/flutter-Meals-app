import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meals.dart';

class CategoriesScreen extends StatelessWidget{
   CategoriesScreen({super.key,required this.onToggleFavorite,required this.availablleMeals});
final List<Meal> availablleMeals;
 void Function(Meal meal) onToggleFavorite;
  void _selectCategory(BuildContext context,Category category){
    var filteredMeals=availablleMeals.where((meal) => 
    meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
      MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite,)));
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your categories'),
      ),
      body: GridView(
        padding:const EdgeInsets.all(24),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
        children:   [
         for(final cat in availableCategories)
            CategoryGridItem(category: cat, onSelectCategory: (){
              _selectCategory(context,cat);
            },)
         

        ],
      ),
    ); 
  }

}