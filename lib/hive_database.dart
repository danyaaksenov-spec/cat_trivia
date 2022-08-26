import 'package:cat_trivia/data/facts/remote/response/facts.dart';
import 'package:hive/hive.dart';

import 'data/facts/local/fact_hive_model.dart';

class HiveDataBase {
  late Box _box;
  String boxName = 'facts';

  HiveDataBase() {
    Hive.openBox<FactHiveModel>(boxName).then((value) => _box = value);
  }

  Future<FactHiveModel> getLastFactsFromLocal() async {
    return _box.values.toList().cast<FactHiveModel>().last;
  }

  Future<List<FactHiveModel>> getAllFactsFromLocal() async {
    return _box.values.toList().cast<FactHiveModel>();
  }

  void addFactsToLocal(FactModel model) async {
    await _box.add(FactHiveModel(fact: model.fact, createdAt: DateTime.now()));
  }
}
