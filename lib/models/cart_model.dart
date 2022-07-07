import 'package:flutter/foundation.dart';

class CartItems with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class CartModel with ChangeNotifier {
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItems) => CartItems(
          id: existingCartItems.id,
          title: existingCartItems.title,
          price: existingCartItems.price,
          quantity: existingCartItems.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItems(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
