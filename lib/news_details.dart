import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news/model.dart';
import 'package:url_launcher/url_launcher.dart';

class newsDetails extends StatefulWidget {
  const newsDetails({super.key, required this.newsmodel});

  @override
  final NewsModel newsmodel;
  State<newsDetails> createState() => _newsDetailsState();
}

class _newsDetailsState extends State<newsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsmodel.title.toString()),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: widget.newsmodel.urlToImage.toString(),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Row(
            children: [
              Container(
                child: Text(widget.newsmodel.source!.name.toString()),
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                child: Text(widget.newsmodel.publishedAt.toString()),
                margin: EdgeInsets.only(left: 10),
              ),
            ],
          ),
          Text(
            widget.newsmodel.author == null
                ? " "
                : "Written by " + widget.newsmodel.author.toString(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.newsmodel.title.toString()),
          SizedBox(
            height: 30,
          ),
          Text(widget.newsmodel.description.toString()),
          Text(widget.newsmodel.title.toString()),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                final Uri uri = Uri.parse(widget.newsmodel.url.toString());
                if (!await launchUrl(uri)) {
                  throw Exception("Could not launch");
                }
              },
              child: Text("Read More...")),
        ],
      ),
    );
  }
}
