import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<dynamic> getRequest(String url) async {

     var urls =Uri.parse(url);
      
    http.Response response = await http.get(urls);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'Error';
      }
    } catch (e) {
      return 'Error';
    }
  }
}
