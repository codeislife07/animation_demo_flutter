import 'package:flutter/material.dart';
import 'package:animation_demo_flutter/models/Recipe.dart';
import 'package:animation_demo_flutter/screens/details.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Widget> _RecipeTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    //after build method call _addRecipes()
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addRecipes();
    });
  }

  void _addRecipes() {
    // get data from db
    List<Recipe> _Recipes = [
      Recipe(title: 'Cakes', price: '350', time: '3', img: 'cake.jpeg'),
      Recipe(title: 'Donuts', price: '400', time: '5', img: 'donuts.jpeg'),
      Recipe(title: 'Cupcakes', price: '750', time: '2', img: 'cupcakes.jpeg'),
      Recipe(title: 'Cookies', price: '600', time: '4', img: 'cookies.jpeg'),
    ];
    var future = Future(() {});
    _Recipes.forEach((Recipe Recipe) {
      //future delay for animation single item
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _RecipeTiles.add(_buildTile(Recipe));
          _listKey.currentState!.insertItem(_RecipeTiles.length-1);
        });
      });

    });

  }

  Widget _buildTile(Recipe recipe) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(recipe: recipe)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${recipe.time} min',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(recipe.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${recipe.img}',
          height: 50.0,width: 50,
        ),
      ),
      trailing: Text('\$${recipe.price}'),
    );
  }

  Tween<Offset> _offset=Tween(begin: Offset(-1,0),end: Offset(0,0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _RecipeTiles.length,
      itemBuilder: (context, index,animation) {
        return SlideTransition(
          // sizeFactor: animation,
          child: _RecipeTiles[index],
          position: _offset.animate(animation),
        );
      }
    );
  }
}


//Thank you for watching
