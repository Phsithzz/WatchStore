import 'package:flutter/material.dart';
import 'package:flutter_ecom/components/button.dart';
import 'package:flutter_ecom/controllers/shop.dart';
import 'package:flutter_ecom/models/product.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //shop a dialog bot to ask user to confirm to remove to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item to your cart?"),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),

          //yes button
          TextButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);
              //add to cart
              context.read<Shop>().removeCart(product);
            },

            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          "User wants to pay! Connect this app to your payment backend",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: const Text("Your cart is empty..."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      ///get individual item in cart
                      final item = cart[index];

                      //return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
