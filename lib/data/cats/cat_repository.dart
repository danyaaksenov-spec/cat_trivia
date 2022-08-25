import 'package:cat_trivia/data/cats/remote/response/cats.dart';
import 'package:dio/dio.dart';

import 'cat_data_source.dart';
import 'remote/cat_api_client.dart';

class CatRepository extends CatDataSource {
  Dio _dio = Dio();
  late CatApiClient _apiClient;

  CatRepository() {
    _dio = Dio();
    _apiClient = CatApiClient(_dio);
  }

  @override
  Future<CatModel> getCat() {
    return _apiClient.getCat();
  }
}
