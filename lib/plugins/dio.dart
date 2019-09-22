import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _uid = 'uid';
final _client = 'client';
final _accessToken = 'access-token';

void _writeSecretValues(String uid, String client, String accessToken) {
  final storage = new FlutterSecureStorage();

  storage.write(key: _uid, value: uid);
  storage.write(key: _client, value: client);
  storage.write(key: _accessToken, value: accessToken);
}

Future<String> _readSecretValue(String key) {
  final storage = new FlutterSecureStorage();

  return storage.read(key: key);
}

void addDioInterceptors() {
  dio.interceptors.add(InterceptorsWrapper(
          onRequest:(Options options) async {
            options.headers[_uid] = await _readSecretValue(_uid);
            options.headers[_client] = await _readSecretValue(_client);
            options.headers[_accessToken] = await _readSecretValue(_accessToken);
            return options;
          },
          onResponse:(Response response) async {
            if(response.headers[_uid] == null ||
                response.headers[_client] == null ||
                response.headers[_accessToken] == null) {
              await _writeSecretValues(null, null, null);
            } else {
              await _writeSecretValues(
                  response.headers[_uid][0],
                  response.headers[_client][0],
                  response.headers[_accessToken][0]);
            }
            return response;
          },
          onError: (DioError e) {
            return e;
          },
  ));
}

BaseOptions _options = new BaseOptions(
    baseUrl: "http://0.0.0.0:3000",
);
Dio dio = new Dio(_options);
