// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';
import 'package:attendance/app/shared/components/custom_snackbar.dart';
import 'package:attendance/app/utils/consts/const.dart';
import 'package:attendance/app/utils/consts/my_strings.dart';
import 'package:attendance/app/utils/my_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  void handleResponseError(Response response) {
    String message = '';
    switch (response.statusCode) {
      case 400:
        message = response.body['message'];
        break;
      case 401:
        message = MyStrings.unAuthorized;
        break;
      case 403:
        message = MyStrings.forbiden;
        break;
      case 404:
        message = MyStrings.noDataFound;
        break;
      case 500:
        message = MyStrings.serverError;
        break;
      default:
        message =
            '${MyStrings.somethingWentWrong} Status code: ${response.statusCode}';
        break;
    }

    log(response.body['message']);
    CustomSnackBar.error(errorList: [message]);
  }

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = '$host/api';
    print("Base URL: ${httpClient.baseUrl}");
    httpClient.addRequestModifier<dynamic>((request) async {
      try {
        print("Request url: ${request.url}");
        final List<ConnectivityResult> connectivityResult =
            await (Connectivity().checkConnectivity());

        if (connectivityResult.contains(ConnectivityResult.none)) {
          CustomSnackBar.error(errorList: [MyStrings.noInternet]);
          throw const SocketException(MyStrings.noInternet);
        }
      } catch (e) {
        log(e.toString());
        MyUtils.exceptionHandler(e);
      }

      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      if (response.statusCode != 200 && response.statusCode != 201) {
        handleResponseError(response);
        log(response.body);
      }
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      return request;
    });
  }
}
