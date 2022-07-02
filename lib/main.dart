import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'models/cart_model.dart';
import 'models/theme.dart';

import 'models/products.dart';
import 'views/product_detail_screen.dart';
import 'views/products_overview_screen.dart';

final settings = ValueNotifier(
  ThemeSettings(
    sourceColor: const Color.fromARGB(255, 240, 10, 182),
    themeMode: ThemeMode.system,
  ),
);

/// creating a new branch Consumer
///
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
          builder: (context, _) => DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) => ThemeProvider(
              lightDynamic: lightDynamic,
              darkDynamic: darkDynamic,
              settings: settings,
              child: const MyApp(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context);
    return ChangeNotifierProvider(
      create: (_) => CartModel(),
      builder: (context, _) => MaterialApp(
        title: 'E Commerce App',
        debugShowCheckedModeBanner: false,
        theme: theme.light(settings.value.sourceColor),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
