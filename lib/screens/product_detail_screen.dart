import 'package:flutter/material.dart';
import '../screens/intro_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductProvider>(context).findById(productId);
    final provider = Provider.of<ProductProvider>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 20,
                child: Consumer<Cart>(
                  builder: (context, value, child) => badges.Badge(
                    badgeContent: Text(value.ItemCount.toString()),
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: Colors.white),
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Center(
                  child: Text(
                'Hey Champ! How You Doing Today..',
                style: TextStyle(color: Colors.white),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Go back home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntroScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Visit Favorites..'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 40),
              child: Text(
                loadedProduct.title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/${loadedProduct.img}',
                // width: 16,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        provider.toggleStatus(loadedProduct.id);
                      },
                      icon: Icon(
                        loadedProduct.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.forward,
                          color: Theme.of(context).colorScheme.secondary))
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '\$ ${loadedProduct.amount.toString()}',
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () {
                    cart.addItem(loadedProduct.id, loadedProduct.amount,
                        loadedProduct.title);
                  },
                  child: const Text('Add tocart'))
            ],
          )
        ],
      ),
    );
  }
}
