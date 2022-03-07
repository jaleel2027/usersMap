import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;


final String key = 'AIzaSyBr5djkSz98A4qZ_7eHKHvLRgi82-IUjy4';

class LocationServices {

  Future<String> getRouteCoordinates(LatLng l1, LatLng l2)async{
  String url = "https://aryupay.com/hrportal/public/tracking/viewreport";
  var response = await http.get(Uri.parse(url));
  Map values = jsonDecode(response.body);
  return values["routes"][0]["overview_polyline"]["points"];
  }
  }