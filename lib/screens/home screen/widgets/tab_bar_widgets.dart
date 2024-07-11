import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/bloc/food_recipes_bloc.dart';
import 'package:recipeapp/dimension/my_dimension.dart';
import 'package:recipeapp/screens/details%20screen/ui/details_screen.dart';
import 'package:recipeapp/screens/home%20screen/widgets/home_tabbar_view_item.dart';
import 'package:recipeapp/screens/home%20screen/widgets/tab_item_widgets.dart';

class TarBarWidgets extends StatefulWidget {
  const TarBarWidgets({super.key});

  @override
  State<TarBarWidgets> createState() => _TarBarWidgetsState();
}

class _TarBarWidgetsState extends State<TarBarWidgets>
    with SingleTickerProviderStateMixin {
  final List<String> tabLabel = ["breakfast", "lunch", "dinner", "quick"];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener((_handleTabSelection));
    context
        .read<FoodRecipesBloc>()
        .add(FoodRecipesLoadedEvent(foodCat: tabLabel[0]));
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      context
          .read<FoodRecipesBloc>()
          .add(FoodRecipesLoadedEvent(foodCat: tabLabel[_tabController.index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        //Tab Bar
        SizedBox(
          height: 45,
          child: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(horizontal: width * 0.012),
            unselectedLabelColor: Colors.teal,
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
            labelColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(MyDimension.radius20)),
            tabs: const [
              TabItem(
                tabTitle: "Breakfast",
              ),
              TabItem(
                tabTitle: "Lunch",
              ),
              TabItem(
                tabTitle: "Dinner",
              ),
              TabItem(
                tabTitle: "Quick",
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),

        //This is the part of Tab Bar View
        SizedBox(
          height: height * 0.35,
          child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //Breakfast Page Builder
                BlocBuilder<FoodRecipesBloc, FoodRecipesState>(
                  builder: (context, state) {
                    if (state is FoodRecipesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FoodRecipesLoadedState) {
                      return SizedBox(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DetailScreen(
                                          recipeModel:
                                              state.recipeModel[index]);
                                    },
                                  ));
                                },
                                child: HomeTabBarViewItem(
                                  recipeModel: state.recipeModel[index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: MyDimension.width20,
                              );
                            },
                            itemCount: state.recipeModel.length),
                      );
                    } else if (state is FoodRecipesErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),

                //Lunch Page Builder
                BlocBuilder<FoodRecipesBloc, FoodRecipesState>(
                  builder: (context, state) {
                    if (state is FoodRecipesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FoodRecipesLoadedState) {
                      return SizedBox(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailScreen(
                                              recipeModel:
                                                  state.recipeModel[index]);
                                        },
                                      ),
                                    );
                                  },
                                  child: HomeTabBarViewItem(
                                    recipeModel: state.recipeModel[index],
                                  ));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: MyDimension.width20,
                              );
                            },
                            itemCount: state.recipeModel.length),
                      );
                    } else if (state is FoodRecipesErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),

                //Dinner Page Builder
                BlocBuilder<FoodRecipesBloc, FoodRecipesState>(
                  builder: (context, state) {
                    if (state is FoodRecipesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FoodRecipesLoadedState) {
                      return SizedBox(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return DetailScreen(
                                            recipeModel:
                                                state.recipeModel[index]);
                                      },
                                    ));
                                  },
                                  child: HomeTabBarViewItem(
                                    recipeModel: state.recipeModel[index],
                                  ));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: MyDimension.width20,
                              );
                            },
                            itemCount: state.recipeModel.length),
                      );
                    } else if (state is FoodRecipesErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                //Quick Page Builder
                BlocBuilder<FoodRecipesBloc, FoodRecipesState>(
                  builder: (context, state) {
                    if (state is FoodRecipesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FoodRecipesLoadedState) {
                      return SizedBox(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return DetailScreen(
                                            recipeModel:
                                                state.recipeModel[index]);
                                      },
                                    ));
                                  },
                                  child: HomeTabBarViewItem(
                                    recipeModel: state.recipeModel[index],
                                  ));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: MyDimension.width20,
                              );
                            },
                            itemCount: state.recipeModel.length),
                      );
                    } else if (state is FoodRecipesErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ]),
        ),
      ],
    );
  }
}
