import 'package:flutter/material.dart';
import 'package:animation_demo_flutter/models/Recipe.dart';
import 'package:animation_demo_flutter/screens/details.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Widget> _RecipeTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addRecipes();
  }

  void _addRecipes() {
    // get data from db
    List<Recipe> _Recipes = [
      Recipe(title: 'Cakes', price: '350', time: '3', img: 'cake.png'),
      Recipe(title: 'Donuts', price: '400', time: '5', img: 'donuts.png'),
      Recipe(title: 'Cupcakes', price: '750', time: '2', img: 'cupcakes.png'),
      Recipe(title: 'Cookies', price: '600', time: '4', img: 'coockies.png'),
    ];

    _Recipes.forEach((Recipe Recipe) {
      _RecipeTiles.add(_buildTile(Recipe));
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
          height: 50.0,
        ),
      ),
      trailing: Text('\$${recipe.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: _RecipeTiles.length,
      itemBuilder: (context, index) {
        return _RecipeTiles[index];
      }
    );
  }
}
