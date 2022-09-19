import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_management/models/photos_model.dart';

class PhotoServiceProvider {
  Future<List<Photo>> _fetchPhoto(http.Client client) async {
    var res = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (res.statusCode == 200) {
      final List<Photo> photos = (json.decode(res.body) as List)
          .map((json) => Photo.fromJson(json))
          .toList();
      log('Fetch Photos : ${photos.length}');
      return photos;
    } else {
      throw Exception('Error Fetching Photo.');
    }
  }

  get fetchDataPhotos => _fetchPhoto(http.Client());
}
