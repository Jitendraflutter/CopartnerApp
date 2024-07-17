
import 'package:assignment/network_services/network/services/copartner_service.dart';
import 'package:assignment/network_services/repository/copartner_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network_services/network/dio_client.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static  setup() {
    // dio client
    getIt.registerSingleton(Dio());
    getIt.registerSingleton(DioClient(getIt<Dio>()));
    getIt.registerSingleton(CopartnerApiService());

    // Repos
    getIt.registerSingleton(CopartnerRepo(getIt<CopartnerApiService>()));
  }
}
