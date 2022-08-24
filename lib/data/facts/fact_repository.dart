import 'package:dio/dio.dart';

import 'package:cat_trivia/data/facts/fact_data_source.dart';
import 'package:cat_trivia/data/facts/remote/fact_api_client.dart';
import 'package:cat_trivia/data/facts/remote/response/facts.dart';

class FactRepository extends FactDataSource {
  Dio _dio = Dio();
  FactApiClient _apiClient;

  var apiKey = "PASTE_YOUR_API_KEY";

  FactRepository(
    this._apiClient,
    this.apiKey,
  ) {
    _dio = Dio();
    _apiClient = FactApiClient(_dio);
  }

  @override
  Future<FactModel> getFact() {
    return _apiClient.getFact();
  }
}
