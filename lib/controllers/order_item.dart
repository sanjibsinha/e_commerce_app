import 'package:flutter/material.dart';

//import 'package:e_commerce_app/models/order_model.dart' as order;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final order;

  const OrderItem(
    Key? key,
    this.order,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
