import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:json_management/models/feeds_model.dart';

class FeedsServiceProvider {
  Future<List<Feed>> _fetchPosts(http.Client client) async {
    var res = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200) {
      final List<Feed> feeds = (json.decode(res.body) as List)
          .map((data) => Feed.fromJson(data))
          .toList();
      log('${feeds.length}');
      return feeds;
    } else {
      throw Exception('Error Fetching Feed.');
    }
  }

  get fetchDataFeeds => _fetchPosts(http.Client());
}


/* class FeedsServiceProvider {
  Future<Feed> _fetchPosts() async {
    var res = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (res.statusCode == 200) {
      Feed data = Feed.fromJson(res.data);
      log(data.title);
      return data;
    } else {
      throw Exception('Error Fetching Data.');
    }
  }

  get fetchDataFeeds => _fetchPosts();
} */