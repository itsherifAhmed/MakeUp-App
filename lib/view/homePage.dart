import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:makeupshop/controller/controller.dart';
import 'package:makeupshop/view/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("MakeUp MVC App"),
        ),
        titleSpacing: 60,
        backgroundColor: Colors.black26,
        toolbarHeight: 50,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color:Colors.black12 ,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Best MakeUp',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                  IconButton(icon: Icon(Icons.add_a_photo_outlined), onPressed: () {}),
                ],
              ),
            ),
            Expanded(
              child: Obx(

                      () {
                    if (productController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else
                      return StaggeredGridView.countBuilder(


                        crossAxisCount: 3,
                        itemCount: productController.productList.length,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return ProductTile(productController.productList[index]);
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      );
                  }),
            )
          ],
        ),
      ),
    );
  }
}


