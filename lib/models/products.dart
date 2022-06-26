import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Smart Phone',
      description: 'A Smart Phone - get big Discount!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/12/13/16/02/ios-1091302_960_720.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Smart TV',
      description: 'A Smart TV.',
      price: 59.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/02/07/20/58/tv-627876_960_720.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Umbrella',
      description: 'Fancy and Beautiful.',
      price: 19.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/14/03/19/umbrella-1822478_960_720.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Pants',
      description: 'Fashionable and modern design.',
      price: 99.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/03/24/19/48/jeans-2172032_960_720.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Shirt',
      description: 'Designed with care.',
      price: 47.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/08/05/10/31/waiting-410328_960_720.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
