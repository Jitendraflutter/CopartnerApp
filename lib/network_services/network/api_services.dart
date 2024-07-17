
import 'package:assignment/network_services/network/dio_client.dart';
import 'package:flutter/material.dart';


import '../../core/service_locator.dart';

/// Base api service
abstract class ApiService {
  // Dio client object
  @protected
  final api = getIt<DioClient>();


}
