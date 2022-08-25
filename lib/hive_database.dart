import 'package:cat_trivia/data/facts/remote/response/facts.dart';
import 'package:hive/hive.dart';

import 'data/facts/local/fact_hive_model.dart';

class HiveDataBase {
  String boxName = 'facts';

  Future<Box> openBox() async {
    Box box = await Hive.openBox<FactHiveModel>(boxName);
    return box;
  }

  List<FactHiveModel> getFactsFromLocal(Box box) {
    return box.values.toList().cast<FactHiveModel>();
  }

  Future<void> addFactsToLocal(Box box, FactHiveModel model) async {
    await box.add(FactHiveModel(fact: model.fact, createdAt: model.createdAt));
  }
}
