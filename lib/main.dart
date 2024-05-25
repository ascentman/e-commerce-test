import 'package:first/basket/basket.dart';
import 'package:first/basket/basket_drawer.dart';
import 'package:first/database.dart';
import 'package:first/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Basket>(
      create: (_) => Basket(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: Image.asset('assets/images/logo.png'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 108, 95, 207),
            title: const Text(
              'Мій магазин',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            actions: [
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: badges.Badge(
                      badgeContent: Text(
                        context.watch<Basket>().products.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      position: badges.BadgePosition.topEnd(top: -12, end: -1),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 5,
                spacing: 5,
                children: [
                  for (int i = 0; i < products.length; i++)
                    ProductCard(
                      product: products[i],
                    ),
                ],
              ),
            ),
          ),
          endDrawer: const BasketDrawer(),
        ),
      ),
    );
  }
}
