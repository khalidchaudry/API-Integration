import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_api_model.dart';
import 'package:http/http.dart' as http;

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({Key? key}) : super(key: key);
  List<UserApiModel> userList = [];
  Future<List<UserApiModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final jsonDecoded = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> data in jsonDecoded) {
        userList.add(UserApiModel.fromJson(data));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
        child: FutureBuilder(
            future: getUserApi(),
            builder: (context, snapshot) => ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    return Card(
                      child: Column(
                        children: [
                          Text(userList[index].id.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userList[index].name.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userList[index].email.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userList[index].phone.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(userList[index].address!.city.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                })),
      )),
    );
  }
}
