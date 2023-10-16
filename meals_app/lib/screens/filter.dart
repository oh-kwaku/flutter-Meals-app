import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';


enum Filter{
  gluttenFree,
  vegetarian,
  vegan,
  lactoseFree
}

class FilterScreen extends StatefulWidget{
  const FilterScreen();

  @override 
  State<FilterScreen> createState(){
    return _FilterScreen();
  }
}


class _FilterScreen extends State<FilterScreen>{
  
  var _glutenFreeFilterset=false;
  var _lactoseFreeFilterSet=false;
  var _vegetrianFilterSet=false;
  var _veganFilterSet=false;

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
        body: WillPopScope(
          onWillPop: ()async {
              Navigator.of(context).pop(
                {
                  Filter.gluttenFree:_glutenFreeFilterset,
                  Filter.vegan:_veganFilterSet,
                  Filter.vegetarian:_vegetrianFilterSet,
                  Filter.lactoseFree:_lactoseFreeFilterSet
                }
  
                );
              return false;
          },
          child: Column(
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
                ),
            SwitchListTile(value: _vegetrianFilterSet,
             onChanged: (selected){
              setState(() {
                _vegetrianFilterSet=selected;
              },
              );
             },
             title:  Text('Vegetarian',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    //color: Theme.of(context.colorScheme.onBackground)
                  ),
             ),
             subtitle: Text('Vegetarains only',
             style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
             ),
             ),
             ),
             SwitchListTile(
              value: _veganFilterSet,
               onChanged: (selected){
                setState(() {
                  _veganFilterSet=selected;
                });
               },
               title: Text('Vegan',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                 
               )),
               subtitle: Text('vegan sub title',
               style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
               ),),
               ),
                SwitchListTile(
              value: _lactoseFreeFilterSet,
               onChanged: (selected){
                setState(() {
                  _lactoseFreeFilterSet=selected;
                });
               },
               title: Text('Lactose-free',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                 
               )),
               subtitle: Text('lactose-free sub title',
               style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
               ),),
               )
            ],
          ),
        ),
    );
  }
}