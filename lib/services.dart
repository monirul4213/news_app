import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model.dart';

class services {
  final allNewsUrl =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=a3729f4d5b4a4b94b9a2471c2ed5aee4";

  final beakingNews =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a3729f4d5b4a4b94b9a2471c2ed5aee4";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(allNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articles;
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(beakingNews));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articles;
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw e;
    }
  }
}
