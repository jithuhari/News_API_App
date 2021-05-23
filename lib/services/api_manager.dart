import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/constants/strings.dart';
import 'package:news_api/models/newsinfo.dart';
class Api_Manager{

  Future<Welcome> getNews() async{
    var client = http.Client();
    var newsModel = null;

    try{

    var response = await client.get(Uri.parse(Strings.news_url));
    if (response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString); 

      newsModel = Welcome.fromJson(jsonMap);
    }
}
catch(Exception)
{
  return newsModel;
}
    return newsModel;
  }

}