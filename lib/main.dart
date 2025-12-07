import 'package:flutter/material.dart';

import 'package:flutter_ecom/controllers/shop.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ecom/screens/cart_page.dart';
import 'package:flutter_ecom/screens/intro_page.dart';
import 'package:flutter_ecom/screens/shop_page.dart';

import 'package:flutter_ecom/themes/light_mode.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      
      home: const IntroPage(),
      routes: {
        "/intro_page": (context) => const IntroPage(),
        "/shop_page": (context) => const ShopPage(),
        "/cart_page": (context) => const CartPage(),
      },
    );
  }
}
