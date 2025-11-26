import 'package:flutter/material.dart';
import 'package:flutter_ecom/components/my_drawer.dart';
import 'package:flutter_ecom/components/my_product_tile.dart';
import 'package:flutter_ecom/controllers/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
        actions: [
          //g to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/cart_page"),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          //shop subtitle
          Center(
            child: Text(
              "Pick from selected list of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                //get each indevidual product from shop
                final product = products[index];
                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
