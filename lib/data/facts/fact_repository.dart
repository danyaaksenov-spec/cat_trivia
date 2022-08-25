import 'package:cat_trivia/data/facts/local/facts_local_storage.dart';
import 'package:dio/dio.dart';

import 'package:cat_trivia/data/facts/fact_data_source.dart';
import 'package:cat_trivia/data/facts/remote/fact_api_client.dart';
import 'package:cat_trivia/data/facts/remote/response/facts.dart';

class FactRepository extends FactDataSource {
  // FactsLocalStorage local;
  Dio _dio = Dio();
  late FactApiClient _apiClient;

  FactRepository() {
    _dio = Dio();
    _apiClient = FactApiClient(_dio);
  }

  @override
  Future<FactModel> getFact() {
    return _apiClient.getFact();
  }
}
