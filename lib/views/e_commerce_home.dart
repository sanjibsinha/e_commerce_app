import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../controllers/app_drawer.dart';
import './../controllers/products_grid.dart';
import '../controllers/stack_cart.dart';
import '../models/cart.dart';
import './cart_screen.dart';

enum FilterOptions {
  favorites,
  all,
}

class ECommerceHome extends StatefulWidget {
  const ECommerceHome({Key? key}) : super(key: key);

  @override
  State<ECommerceHome> createState() => _ECommerceHomeState();
}

class _ECommerceHomeState extends State<ECommerceHome> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E Commerce App'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => StackCart(
              value: cart.itemCount.toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
