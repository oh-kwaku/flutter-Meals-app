import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key,required this.title,required this.meals});
  final String title;
  final List<Meal> meals;

@override
  Widget build(BuildContext context){
    Widget content=  ListView.builder(
      itemCount: meals.length,
            itemBuilder: (ctx,index)=>
            Text(meals[index].title
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
   
 