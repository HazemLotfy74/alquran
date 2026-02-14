import 'package:hive/hive.dart';

part 'revelation_type.g.dart';

@HiveType(typeId: 2)
enum RevelationType {
  @HiveField(0)
  meccan,
  @HiveField(1)
  medinan,
}
