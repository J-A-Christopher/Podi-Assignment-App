import 'package:flutter/material.dart';
import 'package:podi_app/widgets/recommended_widget.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/featured_items.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  File? _image;
  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).existingProducts;
    TextEditingController searchEditingController = TextEditingController();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          // title: const Text('Intro'),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  _openImagePicker();
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person),
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
                          id: prod.id,
                          color: prod.color))
                      .toList()),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            SizedBox(
              height: 50,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.white24,
                bottom: const TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'FEATURED',
                      ),
                      Tab(
                        text: 'COMBOS',
                      ),
                      Tab(
                        text: 'FAVORITES',
                      ),
                      Tab(
                        text: 'RECORD',
                      )
                    ]),
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return FeaturedItems(
                      title: products[index].title,
                      price: products[index].amount,
                      img: products[index].img);
                },
                itemCount: 3,
              ),
              // Center(child: Text('Bike')),
              ListView.builder(
                itemBuilder: (context, index) {
                  return FeaturedItems(
                      title: products[index].title,
                      price: products[index].amount,
                      img: products[index].img);
                },
                itemCount: 3,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return FeaturedItems(
                      title: products[index].title,
                      price: products[index].amount,
                      img: products[index].img);
                },
                itemCount: 3,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return FeaturedItems(
                      title: products[index].title,
                      price: products[index].amount,
                      img: products[index].img);
                },
                itemCount: 3,
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
