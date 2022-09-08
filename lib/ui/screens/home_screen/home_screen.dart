import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Future<List<dynamic>> getMovieApi() async {
    final response = await http
        .get(Uri.parse('http://s3.amazonaws.com/vodassets/showcase.json'));
    final json = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return json;
    } else {
      return json;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Expanded(
                  child: FutureBuilder(
                    future: getMovieApi(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) =>
                        CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data['cardImages']['url'].toString()),
                    ),
                  ),
                ))));
  }
}
