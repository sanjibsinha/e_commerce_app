import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'models/cart.dart';
import 'models/orders.dart';
import 'models/products.dart';
import 'models/theme.dart';
import 'views/cart_page.dart';
import 'views/orders_page.dart';
import 'views/product_detail_page.dart';
import 'views/e_commerce_home.dart';

final settings = ValueNotifier(
  ThemeSettings(
    sourceColor: const Color.fromARGB(255, 240, 10, 182),
    themeMode: ThemeMode.system,
  ),
);

/// creating a new branch adding cart
///
///
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: ECommerce(),
        ),
      ),
    ),
  );
}

class ECommerce extends StatelessWidget {
  ECommerce({Key? key}) : super(key: key);
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context);
    return MaterialApp(
      title: 'E Commerce App',
      scaffoldMessengerKey: _messangerKey,
      debugShowCheckedModeBanner: false,
      theme: theme.light(settings.value.sourceColor),
      home: const ECommerceHome(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrdersScreen.routeName: (ctx) => const OrdersScreen(),
      },
    );
  }
}
