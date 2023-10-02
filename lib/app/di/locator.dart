import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


Future<void> setupLocator() async {
  locator.registerSingleton<HiveDB>(HiveDB());
  await locator<HiveDB>().startHive();
  

  
}
