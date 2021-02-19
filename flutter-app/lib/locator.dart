import 'package:SecondLife/services/api_request_service.dart';
import 'package:SecondLife/services/api_service.dart';
import 'package:SecondLife/services/images_service.dart';
import 'package:SecondLife/services/location_service.dart';
import 'package:SecondLife/state/auth_model.dart';
import 'package:SecondLife/state/chat_model.dart';
import 'package:SecondLife/state/location_model.dart';
import 'package:SecondLife/state/offers_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => ApiRequestService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerFactory(() => ImagesService());

  // State
  locator.registerLazySingleton(() => LocationModel());
  locator.registerLazySingleton(() => OffersModel());
  locator.registerLazySingleton(() => AuthModel());
  locator.registerLazySingleton(() => ChatModel());
}
