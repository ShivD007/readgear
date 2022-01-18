import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:nirog_street/app/core/constants/string_constants.dart';
import 'package:nirog_street/app/core/crash_analytics.dart';
import 'package:nirog_street/app/core/models/api_response_model.dart';
import 'package:nirog_street/app/core/models/failure_model.dart';
import 'package:nirog_street/app/core/network_call/node_api_calls.dart';
import 'package:nirog_street/flavors.dart';

class NodeApiCallsImpl extends GetConnect implements NodeApiCalls {
  String nodeBaseUrl = FlavorTypes.appBaseURL;
  late Response response;

  @override
  Future<Either<FailureModel, ApiResponseModel>> getRequestWithAuth(
      String endpoint, String authToken) async {
    try {
      response = await get(nodeBaseUrl + endpoint, headers: {
        'Accept': 'application/json',
        'x-access-token': authToken,
      });
      return Right(ApiResponseModel.fromJson(response.body));
    } catch (error, stackTrace) {
      await FirebaseCrashAnalyticsMethods.reportError(error, stackTrace);
      return _response(response);
    }
  }

  @override
  Future<Either<FailureModel, ApiResponseModel>> getRequestWithoutAuth(
      String endpoint) async {
    try {
      response = await get(nodeBaseUrl + endpoint);
      return Right(ApiResponseModel.fromJson(response.body));
    } catch (error, stackTrace) {
      await FirebaseCrashAnalyticsMethods.reportError(error, stackTrace);
      return Left(_response(response));
    }
  }

  @override
  Future<Either<FailureModel, ApiResponseModel>> postRequestWithAuth(
      String endpoint, Map body, String authToken) async {
    try {
      response = await post(nodeBaseUrl + endpoint, body, headers: {
        'Accept': 'application/json',
        'x-access-token': authToken,
      });
      return Right(ApiResponseModel.fromJson(response.body));
    } catch (error, stackTrace) {
      await FirebaseCrashAnalyticsMethods.reportError(error, stackTrace);
      return Left(_response(response));
    }
  }

  @override
  Future<Either<FailureModel, ApiResponseModel>> postRequestWithoutAuth(
      String endpoint, Map body) async {
    try {
      response = await post(nodeBaseUrl + endpoint, body);
      return Right(ApiResponseModel.fromJson(response.body));
    } catch (error, stackTrace) {
      await FirebaseCrashAnalyticsMethods.reportError(error, stackTrace);
      return Left(_response(response));
    }
  }

  @override
  Future<Either<FailureModel, ApiResponseModel>> putRequestWithAuth(
      String endpoint, Map body, String authToken) async {
    try {
      response = await put(nodeBaseUrl + endpoint, body, headers: {
        'Accept': 'application/json',
        'x-access-token': authToken,
      });
      return Right(ApiResponseModel.fromJson(response.body));
    } catch (error, stackTrace) {
      await FirebaseCrashAnalyticsMethods.reportError(error, stackTrace);
      return Left(_response(response));
    }
  }

  @override
  Future<Either<FailureModel, ApiResponseModel>> putRequestWithoutAuth(
      String endpoint, Map body) async {
    try {
      response = await put(nodeBaseUrl + endpoint, body);
      return Right(ApiResponseModel.fromJson(response.body));
    } catch (error, stackTrace) {
      await FirebaseCrashAnalyticsMethods.reportError(error, stackTrace);
      return Left(_response(response));
    }
  }

  dynamic _response(Response response) {
    throw FailureModel(errorMessage: SERVER_EXCEPTION, statusCode: null);
    // switch (response.statusCode) {
    //   case 200:
    //     var responseJson = json.decode(response.body.toString());
    //     return responseJson;
    //   case 400:
    //     throw BadRequestException(response.body.toString());
    //   case 401:
    //   case 403:
    //     throw UnauthorisedException(response.body.toString());
    //   case 500:
    //   default:
    //     throw FetchDataException(
    //         'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    // }
  }
}
