import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
class CustomCacheManager extends BaseCacheManager {
  static const key = "customCache";

  static CustomCacheManager _instance;

  factory CustomCacheManager() {
    if (_instance == null) {
      _instance = new CustomCacheManager._();
    }
    return _instance;
  }

  CustomCacheManager._() : super(key,
      maxAgeCacheObject: Duration(minutes: 20),
      maxNrOfCacheObjects: 20,
      fileFetcher: _customHttpGetter);

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }

  static Future<FileFetcherResponse> _customHttpGetter(String url, {Map<String, String> headers}) async {

   var res = await Dio().get(url, options: 
    Options(headers: headers));
    // Do things with headers, the url or whatever.
    return HttpFileFetcherResponse( http.Response(res.data, res.statusCode ,isRedirect:  res.isRedirect,) );
  }
}
