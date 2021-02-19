import 'package:SecondLife/constants.dart';
import 'package:dio/dio.dart';

class ApiRequestService {
  Dio client;

  ApiRequestService() {
    client = Dio(BaseOptions(baseUrl: kApiBaseUrl));
    _setDebugLogInterceptor();
  }

  void _setDebugLogInterceptor() {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options) {
          print('== REQUES T==');
          print(options.data);
          print(options.uri);
          return options;
        },
        onResponse: (options) {
          print('== RESPONSE T==');
          print(options.data);
          return options;
        },
        onError: (options) {
          print('== ERROR ==');
          print(options.message);
          return options;
        },
      ),
    );
  }
}
