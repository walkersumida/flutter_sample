import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void addDioInterceptors() {
  final storage = new FlutterSecureStorage();

  dio.interceptors.add(InterceptorsWrapper(
          onRequest:(Options options) async {
            options.headers['uid'] = await storage.read(key: 'authUid');
            options.headers['client'] = await storage.read(key: 'authClient');
            options.headers['access-token'] = await storage.read(key: 'authAccessToken');
            return options;
          },
          onResponse:(Response response) async {
            await storage.write(key: 'authUid', value: response.headers['uid'][0]);
            await storage.write(key: 'authClient', value: response.headers['client'][0]);
            await storage.write(key: 'authAccessToken', value: response.headers['access-token'][0]);
            return response;
          },
          onError: (DioError e) {
            return e;
          },
  ));
}

BaseOptions options = new BaseOptions(
    baseUrl: "http://0.0.0.0:3000",
);
Dio dio = new Dio(options);
