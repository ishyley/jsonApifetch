import 'dart:convert';
import 'dart:developer';
import 'package:apilistview/model/post.dart';
import 'package:http/http.dart' as client;

class ApiServices {
  static Future<List<Post>?> fetchAllPost() async {
    try {
      final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        final List result = json.decode(response.body);
        log("api called");
        return result.map((e) => Post.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
