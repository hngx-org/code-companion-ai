import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';


class HiveDB {
  static const String box = "_db-codecompanion";
  var log = Logger();

  Future<void> startHive() async {
    await Hive.initFlutter();
    await Hive.openBox(box);
    log.d("Hive Service Started");
  }

  Box getBox() {
    return Hive.box(box);
  }

  Future<void> save(String key, dynamic value) async {
    final box = getBox();
    await box.put(key, value);
    log.d("Value $value have been added as $key to the box");
  }
  

  dynamic get(String key) {
    final box = getBox();
    var value = box.get(key);
    log.d("$key have been retreived as $value from the box");
    return value;
  }

  
  Future<void> remove(String key) async {
    final box = getBox();
    await box.delete(key);
    log.d("$key have been removed from the box");
  }

  Future<void> clear() async {
    final box = getBox();
    await box.clear();
  }
}
