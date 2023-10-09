import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context ){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
    const MealsScreen(title: "sometitle", meals: [])));
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
              _selectCategory(context);
            },)
         

        ],
      ),
    ); 
  }

}