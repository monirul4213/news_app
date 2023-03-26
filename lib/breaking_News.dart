import 'package:flutter/material.dart';
import 'package:news/load_data.dart';

import 'package:news/model.dart';
import 'package:news/services.dart';

class breakingNews extends StatefulWidget {
  const breakingNews({super.key});

  @override
  State<breakingNews> createState() => _breakingNewsState();
}

class _breakingNewsState extends State<breakingNews> {
  services api_service = services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: api_service.getBreakingNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articles = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return loadData(
                  newsmodel: articles[index],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
