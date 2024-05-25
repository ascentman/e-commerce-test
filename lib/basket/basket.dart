import 'package:first/product/product.dart';
import 'package:flutter/material.dart';

class Basket extends ChangeNotifier {
  List<Product> products = [];

  void add(Product product) {
    if (products.contains(product)) {
      products.firstWhere((p) => p.name == product.name).count += 1;
    } else {
      products.add(product);
    }

    notifyListeners();
  }

  void remove(Product product) {
    if (products.contains(product) && product.count > 1) {
      products.firstWhere((p) => p.name == product.name).count -= 1;
    } else {
      products.remove(product);
    }
    notifyListeners();
  }

  double calculatePrice() {
    double sum = 0;
    for (int i = 0; i < products.length; i++) {
      sum += products[i].price * products[i].count;
    }
    return sum;
  }

  String order() {
    String text = 'Ваше замовлення:\n';
    for (int i = 0; i < products.length; i++) {
      text +=
          '${i + 1}. ${products[i].name} ${products[i].count} x ${products[i].price.toStringAsFixed(2)}\n';
    }
    text += '\n\nСума: ${calculatePrice().toStringAsFixed(2)}';
    return text;
  }

  void clearBasket() {
    products = [];
    notifyListeners();
  }
}
