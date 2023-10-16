import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget{
  const FilterScreen();

  @override 
  State<FilterScreen> createState(){
    return _FilterScreen();
  }
}


class _FilterScreen extends State<FilterScreen>{
  
  var _glutenFreeFilterset=false;


  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(onSelectScreen: (identifier){
        //   Navigator.of(context).pop(());
        //   if(identifier=="meals"){
        //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>TabsScreen()));
        //   }
        // }),
        body: Column(
          children: [
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left:34,right:22),
              value: _glutenFreeFilterset, 
              onChanged: (isChecked){
                setState(() {
                  
                _glutenFreeFilterset=isChecked;
                });
              },
              title: Text('Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //color: Theme.of(context.colorScheme.onBackground)
                ),
              ),
              subtitle: Text('only include glutten-free meals',
              style:  Theme.of( context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
              
              ),
              )
          ],
        ),
    );
  }
}