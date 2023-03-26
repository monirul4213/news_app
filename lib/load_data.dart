// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news/model.dart';
import 'package:news/news_details.dart';

class loadData extends StatelessWidget {
  const loadData({
    Key? key,
    required this.newsmodel,
  }) : super(key: key);

  @override
  final NewsModel newsmodel;
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => newsDetails(newsmodel: newsmodel)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsmodel.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Row(
              children: [
                Container(
                  child: Text(newsmodel.source!.name.toString()),
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  child: Text(newsmodel.publishedAt.toString()),
                  margin: EdgeInsets.only(left: 10),
                ),
              ],
            ),
            Text(
              newsmodel.author == null
                  ? " "
                  : "Written by " + newsmodel.author.toString(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(newsmodel.title.toString()),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
