import 'package:flutter/material.dart';
import 'package:news/all_news.dart';
import 'package:news/breaking_News.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Breaking News",
              ),
              Tab(
                text: "All News",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          breakingNews(),
          allNews(),
        ]),
      ),
    );
  }
}
