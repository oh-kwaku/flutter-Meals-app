# flutter-Meals-app
Practicing flutter


## Inkwell
    Use Inkwell to make elements tappable. 
## Navigating to different screen
    though to be able to make screen changes we need to use StatefulWidget, we can add or remove 
    widgets in statelessWidgets by using
    ```
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
    const MealsScreen(title: "sometitle", meals: [])));
    ```