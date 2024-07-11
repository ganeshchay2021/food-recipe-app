import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipeapp/model/recipes_model.dart';

class RecipesRepository {
  final String id = "0f8acdff";
  final String keys = "cd656420c90c3c7703cc7060fbc7081b";

  Future<Either<String, List<RecipeModel>>> getFoodRecipes(
      {required String foodCat}) async {
    try {
      final response = await Dio().get(
          "https://api.edamam.com/search?q=$foodCat&app_id=$id&app_key=$keys&from=0&to=25&calories=591-722&health=alcohol-free", queryParameters: {
          
          });
      final data = List.from(response.data["hits"])
          .map((e) => RecipeModel.fromJson(e))
          .toList();
      return Right(data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to fetch data");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
