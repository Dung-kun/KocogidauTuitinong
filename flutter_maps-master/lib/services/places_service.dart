import 'package:flutter_maps/models/place_search.dart';
import 'package:flutter_maps/secrets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService{
  final key =Secrets.API_KEY;
   Future<List<PlaceSearch>> getAutocomplete(String search) async {
      var url1 =
     'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
      var url = Uri.parse(url1);
      var response = await http.get(url);
      var json= convert.jsonDecode(response.body); 
      var jsonResult=json['predictions'] as List;
      return jsonResult.map((place) => PlaceSearch.fromJson(place)).toList();
   }
}

