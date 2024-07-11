import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/widgets/custom_appbar.dart';
import 'package:recipeapp/widgets/share_recipe.dart';

class ShoppingIngradents extends StatelessWidget {
  const ShoppingIngradents({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width=MediaQuery.of(context).size.width;

    var myBox = Hive.box("shopping");
    return Scaffold(
      appBar: myAppBar(recipeType: "Shopping Ingradients", back: false),
      body: ValueListenableBuilder(
        valueListenable: myBox.listenable(),
        builder: (context, box, child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              var data = box.values.toList();
              return ListTile(
                title: Container(
                  height: height * .085,
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text(data[index])),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                ShareRecipe.share(data[index]);
                              },
                              value: "share",
                              child: const Text("share"),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                myBox.delete(data[index]);
                              },
                              value: "delete",
                              child: const Text("delete"),
                            ),
                          ];
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
