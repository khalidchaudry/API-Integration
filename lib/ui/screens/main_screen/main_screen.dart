import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/ui/models/get_photo_api.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  List<GetPhotoApi> photoList = [];
  Future<List<GetPhotoApi>> getPhotoApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final decodedJson = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in decodedJson) {
        photoList
            .add(GetPhotoApi(id: i['id'], title: i['title'], url: i['url']));
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
      child: FutureBuilder(
          future: getPhotoApi(),
          builder: (context, AsyncSnapshot<List<GetPhotoApi>> snapshot) =>
              ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      return ListTile(
                        title: Text(
                            'Note_id: ${snapshot.data![index].id.toString()}'),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        subtitle: Text(snapshot.data![index].title.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  })),
    )));
  }
}
