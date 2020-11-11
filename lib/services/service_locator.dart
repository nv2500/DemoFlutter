// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // // services
  // serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());
  //
  // // You can replace the actual services above with fake implementations during development.
  // //
  // // serviceLocator.registerLazySingleton<WebApi>(() => FakeWebApi());
  // // serviceLocator.registerLazySingleton<StorageService>(() => FakeStorageService());
  // // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceFake());
  //
  // // view models
  // serviceLocator.registerFactory<CalculateScreenViewModel>(() => CalculateScreenViewModel());
  // serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}