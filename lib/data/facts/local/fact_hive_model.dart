import 'package:hive/hive.dart';

part 'fact_hive_model.g.dart';

@HiveType(typeId: 1)
class FactHiveModel extends HiveObject {
  @HiveField(0)
  String fact;
  @HiveField(1)
  DateTime createdAt;
  FactHiveModel({
    required this.fact,
    required this.createdAt,
  });
}
