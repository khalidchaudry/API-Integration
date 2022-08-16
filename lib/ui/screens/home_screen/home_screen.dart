import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/ui/models/get_post_api.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Future<GetPostAPI> getMovieApi() async {
    final response = await http
        .get(Uri.parse('http://s3.amazonaws.com/vodassets/showcase.json'));
    final json = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return GetPostAPI.fromJson(json);
    } else {
      return GetPostAPI.fromJson(json);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Expanded(
              child: FutureBuilder<GetPostAPI>(
                  future: getMovieApi(),
                  builder: (context, snapshot) => ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => CircleAvatar(
                            backgroundImage: NetworkImage(snapshot
                                .data!.cardImages![index].url
                                .toString()),
                          )))),
        ),
      ),
    );
  }
}
