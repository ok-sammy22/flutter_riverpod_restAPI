import 'dart:convert';
import 'package:assestment/constants/appstring.dart';
import 'package:assestment/models/usermodel.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<List<Usermodel>> fetchUsers() async {
    final response = await http.get(Uri.parse(AppStrings.apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Usermodel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch users");
    }
  }
}
