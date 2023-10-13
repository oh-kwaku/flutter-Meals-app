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
## Stack Widget
    Use it to display elements on top of another element. NB: this is not like the column widget where elements are displayed like rows; stack rather overlays elements.
## Text
    Use
## Card and Stack widgets:
    by default, stack ignores border radius set by parent card. To enfore border radius, the parent Card widget's clipBehaviour must be set ton``` Clip.hardEdge ```.

## ListView
    Use the ListView.builder method when the content to display are long, and you need to specify the numbe of items on a page at a time.
## SingleChildScrollWidget vrs ListView
    Thought both elements provide scrollablitity, ListView requires additional effors to center items- items are left aligned by default.
    With SingleChildScrollWidget, you do not specify page size, and elements are centered by default.