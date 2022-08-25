import 'local/fact_hive_model.dart';

abstract class FactDataSource {
  Future<FactHiveModel> getFact();
}
