// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'food_recipes_bloc.dart';

sealed class FoodRecipesEvent extends Equatable {
  const FoodRecipesEvent();

  @override
  List<Object> get props => [];
}

class FoodRecipesLoadedEvent extends FoodRecipesEvent {
    final String foodCat;
  const FoodRecipesLoadedEvent({
    required this.foodCat,
  });
  @override
  List<Object> get props => [foodCat];
}

