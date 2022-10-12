import 'package:flutter/material.dart';
import 'package:recipes_flutter_apprentice/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: add slider_val here
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label)),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imageUrl)),
            ),
            const SizedBox(
              height: 4,
            ),

            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),

            //TODO: add expanded
            // Expanded Wigdet: expands to fill the space in a Column
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text("${ingredient.quantity * _sliderVal}"
                      "${ingredient.measure}"
                      "${ingredient.name}");
                },
              ),
            ),

            // TODO: slider
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: "${_sliderVal * widget.recipe.servings}",
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
