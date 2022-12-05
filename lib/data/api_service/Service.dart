import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:provider/data/models/Card_model.dart';

class ApiService_card {
  Future<List<CardModel>> getUserData() async {
    try {
      Response response = await https
          .get(Uri.parse("https://banking-api.free.mockoapp.net/user_cards"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<CardModel> carts = (jsonData as List?)
                ?.map((item) => CardModel.fromJson(item))
                .toList() ??
            [];
        return carts;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
