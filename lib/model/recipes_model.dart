// // To parse this JSON data, do
// //
// //     final recipeModel = recipeModelFromJson(jsonString);

// import 'dart:convert';

// List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(json.decode(str).map((x) => RecipeModel.fromJson(x)));

// String recipeModelToJson(List<RecipeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
  final Recipe recipe;

  const RecipeModel({
    required this.recipe,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipe: Recipe.fromJson(json["recipe"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "recipe": recipe?.toJson(),
  // };
}

class Recipe {
  // String? uri;
  final String label;
  final String image;
  // String? source;
  final String url;
  // String? shareAs;
  // int? recipeYield;
  // List<String>? dietLabels;
  // List<String>? healthLabels;
  // List<String>? cautions;
  // List<String>? ingredientLines;
  final List<Ingredient> ingredients;
  final double calories;
  // double? totalWeight;
  final double totalTime;
  // List<String>? cuisineType;
  // List<String>? mealType;
  // List<String>? dishType;
  final Map<String, dynamic> totalNutrients;
  // Map<String, Total>? totalDaily;
  // List<Digest>? digest;

  Recipe({
    // this.uri,
    required this.label,
    required this.image,
    // this.source,
    required this.url,
    // this.shareAs,
    // this.recipeYield,
    // this.dietLabels,
    // this.healthLabels,
    // this.cautions,
    // this.ingredientLines,
    required this.ingredients,
    required this.calories,
    // this.totalWeight,
    required this.totalTime,
    // this.cuisineType,
    // this.mealType,
    // this.dishType,
    required this.totalNutrients,
    // this.totalDaily,
    // this.digest,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        // uri: json["uri"],
        label: json["label"],
        image: json["image"],
        // source: json["source"],
        url: json["url"],
        // shareAs: json["shareAs"],
        // recipeYield: json["yield"],
        // dietLabels: json["dietLabels"] == null ? [] : List<String>.from(json["dietLabels"]!.map((x) => x)),
        // healthLabels: json["healthLabels"] == null ? [] : List<String>.from(json["healthLabels"]!.map((x) => x)),
        // cautions: json["cautions"] == null ? [] : List<String>.from(json["cautions"]!.map((x) => x)),
        // ingredientLines: json["ingredientLines"] == null ? [] : List<String>.from(json["ingredientLines"]!.map((x) => x)),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        calories: json["calories"],
        // totalWeight: json["totalWeight"]?.toDouble(),
        totalTime: json["totalTime"],
        // cuisineType: json["cuisineType"] == null ? [] : List<String>.from(json["cuisineType"]!.map((x) => x)),
        // mealType: json["mealType"] == null ? [] : List<String>.from(json["mealType"]!.map((x) => x)),
        // dishType: json["dishType"] == null ? [] : List<String>.from(json["dishType"]!.map((x) => x)),
        totalNutrients: Map.from(json["totalNutrients"]),
        // totalDaily: Map.from(json["totalDaily"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        // digest: json["digest"] == null ? [] : List<Digest>.from(json["digest"]!.map((x) => Digest.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //     // "uri": uri,
  //     "label": label,
  //     "image": image,
  //     "source": source,
  //     "url": url,
  //     "shareAs": shareAs,
  //     "yield": recipeYield,
  //     "dietLabels": dietLabels == null ? [] : List<dynamic>.from(dietLabels!.map((x) => x)),
  //     "healthLabels": healthLabels == null ? [] : List<dynamic>.from(healthLabels!.map((x) => x)),
  //     "cautions": cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
  //     "ingredientLines": ingredientLines == null ? [] : List<dynamic>.from(ingredientLines!.map((x) => x)),
  //     "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
  //     "calories": calories,
  //     "totalWeight": totalWeight,
  //     "totalTime": totalTime,
  //     "cuisineType": cuisineType == null ? [] : List<dynamic>.from(cuisineType!.map((x) => x)),
  //     "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => x)),
  //     "dishType": dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => x)),
  //     "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  //     "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  //     "digest": digest == null ? [] : List<dynamic>.from(digest!.map((x) => x.toJson())),
  // };
}

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  Unit? unit;
  List<Digest>? sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  factory Digest.fromJson(Map<String, dynamic> json) => Digest(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: json["schemaOrgTag"],
        total: json["total"]?.toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"]?.toDouble(),
        unit: unitValues.map[json["unit"]]!,
        sub: json["sub"] == null
            ? []
            : List<Digest>.from(json["sub"]!.map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag,
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unitValues.reverse[unit],
        "sub":
            sub == null ? [] : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}

enum Unit { EMPTY, G, KCAL, MG, UNIT_G }

final unitValues = EnumValues({
  "%": Unit.EMPTY,
  "g": Unit.G,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G
});

class Ingredient {
  final String text;
  final double quantity;
  final String measure;
  final String food;
  final double weight;
  final String foodCategory;
  final String foodId;
  final String? image;

  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"] ?? "",
        quantity: json["quantity"] ?? "0",
        measure: json["measure"] ?? "",
        food: json["food"] ?? "",
        weight: json["weight"] ?? "",
        foodCategory: json["foodCategory"] ?? "",
        foodId: json["foodId"] ?? "",
        image: json["image"] ??
            "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "quantity": quantity,
        "measure": measure,
        "food": food,
        "weight": weight,
        "foodCategory": foodCategory,
        "foodId": foodId,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
