
import 'package:dio/dio.dart';
import 'package:provider_part_one/data/models/Card_model.dart';
import 'package:provider_part_one/data/my_response/my_response.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getSingleCardById(int id) async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/albums/$id");
      if (response.statusCode == 200) {
        myResponse.data = UsersCardsModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
      //print(err.toString());
    }

    return myResponse;
  }

  Future<MyResponse> getAllCards() async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/user_cards");
      if (response.statusCode == 200) {
        myResponse.data =
            (response.data as List?)?.map((e) => UsersCardsModel.fromJson(e)).toList() ??
                [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}