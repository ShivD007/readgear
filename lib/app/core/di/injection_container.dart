import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:readgear/app/core/network_call/node_api_call_impl.dart';
import 'package:readgear/app/core/network_call/node_api_calls.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // common
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerFactory<NodeApiCalls>(() => NodeApiCallsImpl());
}
