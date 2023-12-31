import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealDetailsScreen extends StatelessWidget{
    MealDetailsScreen({super.key,required this.meal, required this.onToggleFavorite});

   void Function (Meal meal) onToggleFavorite;

  final Meal meal;
  @override
  Widget build(BuildContext context){
    return 
  Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
          onToggleFavorite(meal);
        }, icon:Icon(Icons.star))
      ],
      title: Text(meal.title),
     
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Image.network(meal.imageUrl,
          width: double.infinity,
          ),
          const SizedBox(height: 14,),
          Text('Ingredients',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 14,),
          for(final ingredient in meal.ingredients)
          Text(ingredient,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground
          ),),
          const SizedBox(height: 14,),
           Text('Steps',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 14,),
          for(final step in meal.steps)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8
            ),
            child: Text(
              step,
              textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),),
          )
    
    
        ],
      ),
    ),
  );
  }
}