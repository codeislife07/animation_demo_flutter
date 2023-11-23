
import 'package:flutter/material.dart';
import 'package:animation_demo_flutter/models/Recipe.dart';
import 'package:animation_demo_flutter/shared/heart.dart';

class Details extends StatelessWidget {

  final Recipe recipe;
  Details({ required this.recipe });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                'images/${recipe.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                  recipe.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800]
                )
              ),
              subtitle: Text(
                '${recipe.time} min to make \$${recipe.price}',
                style: TextStyle(letterSpacing: 1)
              ),
              trailing: Heart()
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                "description texts",
                style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.4
                )
              )
            ),
          ],
        ),
      )
    );
  }
}