import 'package:get_it/get_it.dart';
import 'package:last_step/Services/data_service.dart';
import 'package:last_step/Services/services.dart';

GetIt locator = GetIt.instance;
setupServiceLocator() {
  print('====================1');
  try {
    locator.registerLazySingleton<DataService>(() => Services());
  } catch (e) {
    print("=============================$e");
  }
}
