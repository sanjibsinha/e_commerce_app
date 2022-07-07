import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  /// product detail page
  ///
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    print(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(
        width: 350.0,
        height: 350.0,
        margin: const EdgeInsets.all(20.0),
        child: Image.network(
          loadedProduct.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
