import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:readgear/app/core/models/failure_model.dart';
import 'package:readgear/flavors.dart';
import '../models/api_response_model.dart';

abstract class NodeApiCalls {
  static String appBasesUrl = FlavorTypes.appBaseURL;
  late Response response;

  Future<Either<FailureModel, ApiResponseModel>> getRequestWithAuth(
      String endpoint, String authToken);
  Future<Either<FailureModel, ApiResponseModel>> getRequestWithoutAuth(
      String endpoint);
  Future<Either<FailureModel, ApiResponseModel>> postRequestWithAuth(
      String endpoint, Map body, String authToken);
  Future<Either<FailureModel, ApiResponseModel>> postRequestWithoutAuth(
      String endpoint, Map body);
  Future<Either<FailureModel, ApiResponseModel>> putRequestWithAuth(
      String endpoint, Map body, String authToken);
  Future<Either<FailureModel, ApiResponseModel>> putRequestWithoutAuth(
      String endpoint, Map body);
}
