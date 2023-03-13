// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../dadata/autocompleteApi.dart';
//
// _parseAndDecode(String response) {
//   return jsonDecode(response);
// }
//
// parseJson(String text) {
//   return compute(_parseAndDecode, text);
// }
//
// @module
// abstract class DadataModule {
//   @lazySingleton
//   Dio dioData() {
//     final dioData = Dio(BaseOptions(
//         baseUrl: 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest',
//         responseType: ResponseType.json,
//         contentType: ContentType.json.toString()));
//
//     dioData.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
//
//     (dioData.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
//
//     return dioData;
//   }
//
//   @lazySingleton
//   AutocompleteApi autofillApi(Dio dioData) => AutocompleteApi(dioData);
// }

// @module
// abstract class DadataModule {
//   @lazySingleton
//   Dio dio() {
//     final dio = Dio(BaseOptions(
//         baseUrl: 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest',
//         responseType: ResponseType.json,
//         contentType: ContentType.json.toString()));
//
//     dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
//
//     (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
//
//     return dio;
//   }
//
//   @lazySingleton
//   AutocompleteApi autofillApi(Dio dio) => AutocompleteApi(dio);
// }
