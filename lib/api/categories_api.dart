import 'package:http/http.dart' as http;
import 'package:news_app/models/category.dart';
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';

class CategoriesAPI {
  Future<List<Category>> fetchAllCategories() async {
    List<Category> categories = List<Category>();
    String allCategoriesApi = base_api + all_categories_api;
    var response =await  http.get(allCategoriesApi);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
          Category category = Category(item["id"].toString(), item["title"].toString());
          categories.add(category);
        }
    }
    return categories;
  }
}