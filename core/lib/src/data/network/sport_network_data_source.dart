import 'dart:convert';

import 'package:core/src/data/network/endpoints.dart';
import 'package:core/src/model/sport.dart';
import 'package:core/src/model/leagues.dart';
import 'package:http/http.dart' as http;

class SportNetworkDataSource {
  Future<SportResponse> getSport(String sport) async{
    final String url = '${EndPoints.BASE_URL}$sport';

    var response = await _httpGetRequest(url)
    .then(json.decode)
    .catchError((error) => print(error.toString()));

    print(response);
    print(url);
    return SportResponse.fromJSON(response);
  }

  Future<LeaguesResponse> getLeagues(String leagues) async{
    final String url = '${EndPoints.BASE_URL}$leagues';

    var response = await _httpGetRequest(url)
    .then(json.decode)
    .catchError((error) => print(error.toString()));;
    print(response);
    print(url);
    return LeaguesResponse.fromJSON(response);
  }

  Future<String> _httpGetRequest(String url) =>
      http.get(url).then((response) => response.body);
}