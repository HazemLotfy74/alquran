import 'package:alquran/core/enums/revelation_type.dart';
import 'package:alquran/core/services/local_storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entities/ayah_entity.dart';
import '../entities/surah_entity.dart';

class HiveService implements LocalStorageService {
  final Map<String, Box> _boxes = {};

  @override
  bool contains(String boxName, key) {
    return getBox(boxName).containsKey(key);
  }

  @override
  Future<void> delete<T>(String boxName, dynamic key) async {
    await getBox<T>(boxName).delete(key);
  }

  @override
  T? get<T>(String boxName, dynamic key) {
    return getBox<T>(boxName).get(key);
  }

  @override
  List<T> getAll<T>(String boxName) {
    return getBox<T>(boxName).values.toList();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SurahEntityAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(AyahEntityAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(RevelationTypeAdapter());
    }
  }

  @override
  Future<void> openBox<T>(String boxName) async {
    if (!_boxes.containsKey(boxName)) {
      _boxes[boxName] = await Hive.openBox<T>(boxName);
    }
  }

  Box<T> getBox<T>(String boxName) {
    final box = _boxes[boxName];
    if (box == null) {
      throw Exception('Box "$boxName" is not opened');
    }
    return box as Box<T>;
  }

  @override
  Future<void> put<T>(String boxName, dynamic key, T value) async {
    await getBox<T>(boxName).put(key, value);
  }
}
