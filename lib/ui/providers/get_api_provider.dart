import 'package:flutter/cupertino.dart';
import 'package:movie_app/ui/models/get_api_model.dart';

class GetAPIProvider with ChangeNotifier {
  List<GetApiModel> getList = [];
  getApiData(
      {required int userId,
      required int id,
      required String title,
      required String body}) async {
    GetApiModel(userId: userId, id: id, title: title, body: body);
    notifyListeners();
  }
}
