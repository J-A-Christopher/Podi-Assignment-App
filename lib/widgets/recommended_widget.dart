import 'dart:io';

import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class RecommendedWidget extends StatelessWidget {
  final String image;
  final String title;
  final double amount;
  final String id;

  const RecommendedWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.amount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailScreen.routName,
              arguments: id);
        },
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.blue.withOpacity(.2),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Image.asset(
                    'assets/$image',
                    height: Platform.isAndroid
                        ? 60
                        : MediaQuery.of(context).size.height * 0.4,
                    width: Platform.isAndroid
                        ? 60
                        : MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$ ${amount.toString()}'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
