import 'dart:convert';

import 'package:http/http.dart';
import 'package:teamwavetask/common/constants/constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final uri = Uri.parse('$BASE_URL$path');
    final response = await _client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }
}
