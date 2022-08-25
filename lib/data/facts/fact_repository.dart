import 'package:cat_trivia/data/facts/fact_data_source.dart';
import 'package:cat_trivia/data/facts/remote/fact_api_client.dart';
import 'package:dio/dio.dart';

import '../../hive_database.dart';
import 'local/fact_hive_model.dart';

class FactRepository extends FactDataSource {
  Dio _dio = Dio();
  late FactApiClient _apiClient;
  late HiveDataBase _hiveDataBase;

  FactRepository() {
    _dio = Dio();
    _apiClient = FactApiClient(_dio);
    _hiveDataBase = HiveDataBase();
  }

  @override
  Future<FactHiveModel> getFact() async {
    var resp = await _apiClient.getFact();
    _hiveDataBase.addFactsToLocal(resp);
    return _hiveDataBase.getLastFactsFromLocal();
  }

  @override
  Future<List<FactHiveModel>> getAllFactsFromLocal() async {
    return _hiveDataBase.getAllFactsFromLocal();
  }
}
