class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imageUrl, this.servings, this.ingredients);

  // method
  static List<Recipe> samples = [
    Recipe("Spaghetti and Meatballs", 'assets/spaghetti-meatballs.jpg', 4, [
      Ingredient(1, "Box", "Spaghetti"),
      Ingredient(4, "", "Frozen Meatballs"),
      Ingredient(0.5, "jar", "sauce"),
    ]),
    Recipe("Tomato Soup", 'assets/tomato-soup.webp', 2,
        [Ingredient(1, "can", "Tomato Soup")]),
    Recipe("Tomato Soup", 'assets/grilled-cheese.webp', 1, [
      Ingredient(2, "slices", "Cheese"),
      Ingredient(2, "slices", "Bread"),
    ]),
    Recipe("Chocolate Chip Cookies", 'assets/chocolate-chips.jpg', 24, [
      Ingredient(4, "cups", "flour"),
      Ingredient(2, "cups", "sugar"),
      Ingredient(0.5, "cups", "chocolate chips"),
    ]),
    Recipe("Taco Salad", 'assets/taco-salad.jpg', 1, [
      Ingredient(4, "oz", "nachos"),
      Ingredient(3, "oz", "taco meat"),
      Ingredient(0.5, "cup", "cheese"),
      Ingredient(0.25, "cup", "chopped tomatos"),
    ]),
    Recipe("Hawaiin Pizza", 'assets/hawain-pizza.crdownload', 4, [
      Ingredient(1, "item", "pizza"),
      Ingredient(1, "cup", "pinapple"),
      Ingredient(1, "oz", "ham"),
    ]),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
