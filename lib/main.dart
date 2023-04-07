import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/intro_screen.dart';
import './providers/product_provider.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
        routes: {
          ProductDetailScreen.routName: (context) => const ProductDetailScreen()
        },
      ),
    );
  }
}
