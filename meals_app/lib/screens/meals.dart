import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_item.dart';

import 'meal_detail.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key,required this.title,required this.meals});
  final String title;
  final List<Meal> meals;

void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

void showMeal(BuildContext context,Meal meal){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
        MealDetailsScreen(meal:meal)));
    }
@override
  Widget build(BuildContext context){
    Widget content=  ListView.builder(
      itemCount: meals.length,
            itemBuilder: (ctx,index)=>
            MealItem(meal: meals[index],
            onShowDetails:(meal){ 
               showMeal(context,meals[index]);
              }
              )
            );
            
    if(meals.isEmpty){
      content=  Center(
       // mainAxisSize:MainAxisSize.min,
        child: Column(children: [
         Text('No meals data folund',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground)
        ),
      const SizedBox(
        height: 60,
      ),
      Text('Try selecting a differe category',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground),
      )
      ]));
    }
    return Scaffold(
      appBar: AppBar(
        title:const Text('Some text'),
      ),
      body : content
        
            );
  }
}
   
 