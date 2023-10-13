import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealItemTrait extends StatelessWidget{
  const MealItemTrait({super.key,required this.icon,required this.label});
 
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context){
    return 
     Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white
            ),
           )      ],
     );
  }
}