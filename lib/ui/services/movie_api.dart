import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieApi {
  Future<List<dynamic>> getMovieData() async {
    final response = await http
        .get(Uri.parse('http://s3.amazonaws.com/vodassets/showcase.json'));
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return json;
    } else {
      return json;
    }
  }
}
