import 'package:flutter/foundation.dart';
import 'package:e_commerce_app/models/cart_model.dart';

class OrderModel {
  final String id;
  final double amount;
  final List<CartItems> products;
  final DateTime dateTime;

  OrderModel({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class OrdersClass with ChangeNotifier {
  final List<OrderModel> _ordersClass = [];

  List<OrderModel> get ordersClass {
    return [..._ordersClass];
  }

  void addOrder(List<CartItems> cartProducts, double total) {
    _ordersClass.insert(
      0,
      OrderModel(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
