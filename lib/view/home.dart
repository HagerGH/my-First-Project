import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:makeup/controller/controller.dart';
import 'package:makeup/model/model.dart';
import 'package:makeup/controller/controller.dart';
import 'package:makeup/view/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Make Up Mvc"),
        ),
        titleSpacing: 60,
        backgroundColor: Colors.black26,
        toolbarHeight: 50,
        elevation: 8,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],

      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: Text("Best Makeup", style: TextStyle(
                    fontSize: 52, fontWeight: FontWeight.w900),),),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.add_a_photo_outlined)),
              ],
            ),

          ),
          Expanded(
            child: Obx(

                    () {
                  if (ProductController().isLoading.value) {
                    return  const Center(child: CircularProgressIndicator());
                  } else {
                    return MasonryGridView.builder(
                        itemCount: 1000,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) =>
                            ProductTile(ProductController().productList() as Product)

                    );
                  }
                }),)
        ],
      ),

    );
  }
}

