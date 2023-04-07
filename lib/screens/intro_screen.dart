import 'package:flutter/material.dart';
import 'package:podi_app/widgets/recommended_widget.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).existingProducts;
    TextEditingController searchEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        // title: const Text('Intro'),
        backgroundColor: Colors.white,
        elevation: 0,
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
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                'SEARCH FOR \nRECIPES',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: searchEditingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                filled: true,
                hintText: 'Search',
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'Recommended',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
          Expanded(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: products
                    .map((prod) => RecommendedWidget(
                        image: prod.img,
                        title: prod.title,
                        amount: prod.amount,
                        id: prod.id))
                    .toList()),
          )
        ],
      ),
    );
  }
}
