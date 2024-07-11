part of 'food_recipes_bloc.dart';

sealed class FoodRecipesState extends Equatable {
  
  const FoodRecipesState();

  @override
  List<Object> get props => [];
}

final class FoodRecipesInitialState extends FoodRecipesState {}

final class FoodRecipesLoadingState extends FoodRecipesState {}

final class FoodRecipesLoadedState extends FoodRecipesState {
  final List<RecipeModel> recipeModel;

  const FoodRecipesLoadedState({required this.recipeModel});
  @override
  List<Object> get props => [recipeModel];
}

final class FoodRecipesErrorState extends FoodRecipesState {
  final String errorMsg;
  const FoodRecipesErrorState({required this.errorMsg});
  
  @override
  List<Object> get props => [errorMsg];

}
