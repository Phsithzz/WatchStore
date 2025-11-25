import 'package:flutter/material.dart';
import 'package:flutter_ecom/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 10),
            //title
            const Text(
              "Watch Store",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            //subtitle
            Text(
              "Primium Quality Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 10),
            //button
            MyButton(onTap: () {}, child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
