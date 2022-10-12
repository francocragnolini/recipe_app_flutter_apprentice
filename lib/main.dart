import 'package:flutter/material.dart';
import 'package:recipes_flutter_apprentice/models/recipe.dart';
import 'package:recipes_flutter_apprentice/pages/recipe_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.grey, secondary: Colors.black)),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // widget.title references home: const MyHomePage(title: 'Recipe Calculator'),
      appBar: AppBar(title: Text(widget.title)),
      // SafeArea:keeps the app from getting too close to the operating system ex. notch
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (context, index) {
            // detects gestures as ontap
            return GestureDetector(
                // it's a callback called when the widget is tapped(card)
                onTap: () {
                  //Push a new material page onto the stack
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetail(recipe: Recipe.samples[index]),
                      ));
                },
                // defines the area where the gesture is active.
                child: buildRecipeCard(Recipe.samples[index]));
          },
        ),
      ),
    );
  }

  // method: creates a custom widget: card
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // determines how high off the screen the card is
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(recipe.imageUrl),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino'),
            )
          ],
        ),
      ),
    );
  }
}
