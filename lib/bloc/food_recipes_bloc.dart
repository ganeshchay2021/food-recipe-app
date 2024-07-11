// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:recipeapp/model/recipes_model.dart';
import 'package:recipeapp/resources/recipes_repository.dart';

part 'food_recipes_event.dart';
part 'food_recipes_state.dart';

class FoodRecipesBloc extends Bloc<FoodRecipesEvent, FoodRecipesState> {
  final RecipesRepository recipesRepository;

  FoodRecipesBloc({required this.recipesRepository})
      : super(FoodRecipesInitialState()) {
    on<FoodRecipesLoadedEvent>((event, emit) async {
      try {
        emit(FoodRecipesLoadingState());
        var result =
            await recipesRepository.getFoodRecipes(foodCat: event.foodCat);
        result.fold((error) => emit(FoodRecipesErrorState(errorMsg: error)),
            (data) => emit(FoodRecipesLoadedState(recipeModel: data)));
      } catch (e) {
        emit(FoodRecipesErrorState(errorMsg: e.toString()));
      }
    });
  }
}
