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
    ChangeNotifierProvider(
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
  );
}

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
      /* home: const DeliverMessage(),
      routes: {
        ExtractingMessage.routeName: (ctx) => const ExtractingMessage(),
      }, */
    );
  }
}

class DeliverMessage extends StatelessWidget {
  const DeliverMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deliver Message'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              ExtractingMessage.routeName,
              arguments: Message(
                'This is Title',
                'This isMessage.',
              ),
            );
          },
          child: Text(
            'Navigate to extract Message',
            style: GoogleFonts.alexBrush(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Message {
  final String title;
  final String message;

  Message(this.title, this.message);
}

class ExtractingMessage extends StatelessWidget {
  const ExtractingMessage({super.key});

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Message;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(
          args.message,
          style: GoogleFonts.alexBrush(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
