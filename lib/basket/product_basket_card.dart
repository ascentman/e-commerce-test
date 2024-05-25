import 'package:first/basket/basket.dart';
import 'package:first/product/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductBasketCard extends StatelessWidget {
  final Product product;
  const ProductBasketCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 125,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    product.image,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                    ),
                    child: Text(
                      '\$ ${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<Basket>().remove(product);
                      //
                    },
                    child: Icon(
                      product.count > 1 ? Icons.remove : Icons.delete,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      product.count.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<Basket>().add(product);
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
