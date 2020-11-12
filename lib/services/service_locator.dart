// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
import 'package:flutter_app/business_logic/view_models/products_viewmodel.dart';
import 'package:flutter_app/services/product/product_service_abs.dart';
import 'package:flutter_app/services/product/product_service_implement.dart';
import 'package:flutter_app/services/webapi/web_api_abs.dart';
import 'package:flutter_app/services/webapi/web_api_service_fake.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  // serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiFake());

  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());

  serviceLocator.registerLazySingleton<ProductService>(() => ProductServiceImpl());

  // view models
  serviceLocator.registerFactory<ProductsViewModel>(() => ProductsViewModel());
}