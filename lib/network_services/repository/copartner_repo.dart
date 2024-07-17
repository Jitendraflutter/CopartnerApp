
import 'package:assignment/model/copartner_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../model/custom_error.dart';
import '../network/custom_dio_exception.dart';
import '../network/services/copartner_service.dart';

class CopartnerRepo {
  final CopartnerApiService _copartnerServices;

  CopartnerRepo(this._copartnerServices);

  FutureResult<CopartnersModel> getAllCopartner(String id) async {
    try {
      var response = await _copartnerServices.fetchCopartnerList(id);
      final result=copartnersModelFromJson(response.toString());
      return right(result);
    } on DioException catch (e) {
      var error = CustomDioExceptions.handleError(e);
      return left(error);
    }
  }
}
