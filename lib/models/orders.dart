import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderClass {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderClass({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderClass> _orders = [];

  List<OrderClass> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderClass(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
