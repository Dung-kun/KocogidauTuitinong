import 'package:flutter/cupertino.dart';
import 'package:flutter_maps/models/place_search.dart';
import 'package:flutter_maps/services/places_service.dart';

class ApplicationBloc with ChangeNotifier{

  final PlacesService _placesService = PlacesService();
  List<PlaceSearch> searchResults;

  searhPlaces(String searchItem) async{
    searchResults =  await _placesService.getAutocomplete(searchItem);
    notifyListeners();
  }
  
  nullSearch()
  {
    searchResults = null;
    notifyListeners();
  }
}