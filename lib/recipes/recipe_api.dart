import 'dart:convert';
import 'package:consumo_api/recipes/recipes.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipes>?>? getRecipes() async {
    Uri uri = Uri.https(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
    );
    http.Response response = await http.get(uri, headers: {
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'X-RapidAPI-Key': 'bf6b783543mshc8b7bbc276700b8p1e77efjsn522dafc17fac'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i?['content']?['details']);
    }
    return Recipes.recipesFromSnapshot(_temp);
  }
}
