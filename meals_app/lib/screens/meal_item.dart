import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget{
 const MealItem({super.key,required this.meal,required this.onShowDetails});

  final Meal meal;

  final void Function  ( Meal meal)  onShowDetails;
 

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.all(10),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
 
    
      child: InkWell(
        onTap:(){
           onShowDetails(meal);
           },
        child: Stack(
          children: [
            // Image.network(meal.imageUrl),
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
             image: NetworkImage(meal.imageUrl),
             height: 200,
             width: double.infinity,
             fit:BoxFit.cover
             ),
             Positioned( 
              bottom: 5,
              left: 5,
              right: 10,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(
                  children:[
                  Text(meal.title,maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon:Icons.schedule,
                        label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(icon:Icons.work,
                        label: '${meal.complexity.name} ',
                        ),
                         const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(icon:Icons.attach_money,
                        label: '${meal.affordability.name} ',
                        ),
                      ],
                    )
                   
          ]),
              )
             )
          ],
        
        ),
         ),
    );
  }
}