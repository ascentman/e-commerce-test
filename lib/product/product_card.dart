import 'package:first/basket/basket.dart';
import 'package:first/product/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 270,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            product.image,
            height: 150,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$ ${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<Basket>().add(product);
            },
            child: const Text(
              'Купити',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 170, 23),
              ),
            ),
          )
        ],
      ),
    );
  }
}
