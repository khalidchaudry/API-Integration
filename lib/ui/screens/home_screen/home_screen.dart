import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/ui/constants.dart';
import 'package:movie_app/ui/screens/home_screen/widgets/rich_text_widget.dart';

import '../../models/get_post_api.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<GetPostApi> postList = [];
  Future<List<GetPostApi>> getPostApi() async {
    final response = await http
        .get(Uri.parse('http://s3.amazonaws.com/vodassets/showcase.json'));
    final jsonDocode = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> json in jsonDocode) {
        postList.add(GetPostApi.fromJson(json));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: getPostApi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "http://vodassets.s3-website-us-east-1.amazonaws.com/images/unscaled/2013/11/05/2-Days-In-Paris-1-VPA.jpg",
                                      //postList[index]
                                      //     .keyArtImages![index]
                                      //     .url
                                      //     .toString(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Title: ',
                                      text: postList[index].headline.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Genre: ',
                                      text: postList[index].genres.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Duration: ',
                                      text: postList[index].duration.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Cert: ',
                                      text: postList[index].cert.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Last Updateed: ',
                                      text: postList[index]
                                          .lastUpdated
                                          .toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'ID: ',
                                      text: postList[index].id.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Rating: ',
                                      text: postList[index].rating.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Quote: ',
                                      text: postList[index].quote.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Release Year: ',
                                      text: postList[index].year.toString(),
                                      textStyle: kFieldTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Synopsis: ',
                                      text: postList[index].synopsis.toString(),
                                      textStyle: kbodyTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichTextWidget(
                                      title: 'Body: ',
                                      text: postList[index].body.toString(),
                                      textStyle: kbodyTextStyle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.purple,
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
