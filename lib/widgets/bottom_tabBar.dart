import 'package:flutter/material.dart';

class TabBarViewN extends StatefulWidget {
  const TabBarViewN({super.key});

  @override
  State<TabBarViewN> createState() => _TabBarViewNState();
}

class _TabBarViewNState extends State<TabBarViewN> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.flight),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.flag),
            ),
            Tab(
              icon: Icon(Icons.r_mobiledata),
            ),
            Tab(
              icon: Icon(Icons.south_america),
            )
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: Icon(Icons.flight),
          ),
          Center(
            child: Icon(Icons.flight),
          ),
          Center(
            child: Icon(Icons.flight),
          ),
          Center(
            child: Icon(Icons.flight),
          )
        ]),
      ),
    );
  }
}
