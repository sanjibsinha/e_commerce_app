import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../models/orders.dart' show Orders;
import './../controllers/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
