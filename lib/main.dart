import 'package:dynamic_color/dynamic_color.dart';
import 'package:e_commerce_app/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/products.dart';
import 'views/product_detail_screen.dart';
import 'views/products_overview_screen.dart';

final settings = ValueNotifier(
  ThemeSettings(
    sourceColor: const Color.fromARGB(255, 240, 10, 182),
    themeMode: ThemeMode.system,
  ),
);

/// creating a new branch
///
void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Products>(create: (_) => Products()),
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: const MyApp(),
        ),
      ),
    ),
  );
}

/// changed to seven
///
/**
 * ChangeNotifierProvider(
      create: (context) => Products(),
      builder: (context, _) => DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: const MyApp(),
        ),
      ),
    ),
 */
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context);
    return MaterialApp(
      title: 'E Commerce App',
      theme: theme.dark(settings.value.sourceColor),
      home: const ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
      },
    );
  }
}
