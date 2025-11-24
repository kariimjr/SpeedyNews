import 'package:dio/dio.dart';
import 'package:newsapp/core/api/models/news_response.dart';

class ApiManager{
  static final _dio=Dio(
    BaseOptions(
      followRedirects: false,
      baseUrl: "https://newsapi.org/v2/",
      headers: {"x-api-key":"a2be006fe2f24c0b84866f79056b5f5f"},
    )

  );
  static Future<List<Articles>>getNews(String sourceId) async{
    var response=await _dio.get("everything?sources=$sourceId");
    try{
      if(response.statusCode==200){
        var data=NewsResponse.fromJson(response.data);
        return data.articles ?? [];
      }else{
        throw response.data;
      }
    }catch(e,s){
      print(e);
      print(s);
      rethrow;
    }

  }

  static Future<List<Source>> getSources(String categoryId) async {
    try {
      var response = await _dio.get("top-headlines/sources",
          queryParameters: {"category": categoryId});
      List<Source> sources = [];
      if (response.statusCode == 200) {
        var data = response.data["sources"];
        for (var e in data) {
          sources.add(Source.fromJson(e));
        }
        return sources;
      } else {
        throw response.data;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}