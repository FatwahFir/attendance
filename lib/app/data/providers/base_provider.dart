// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:attendance/app/utils/consts/const.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  // void handleResponseError(Response response) {
  //   String message = '';
  //   switch (response.statusCode) {
  //     case 400:
  //       message = response.body['message'];
  //       break;
  //     case 401:
  //       message = MyStrings.unAuthorized;
  //       break;
  //     case 403:
  //       message = MyStrings.forbidden;
  //       break;
  //     case 404:
  //       message = MyStrings.notFound;
  //       break;
  //     case 500:
  //       message = MyStrings.internalServerError;
  //       break;
  //     default:
  //       message =
  //           '${MyStrings.unknownError} Status code: ${response.statusCode}';
  //       break;
  //   }

  //   log(response.body['message']);
  //   // CustomSnackBar.error(errorList: [message]);
  // }

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = '$host/api';
    print("Base URL: ${httpClient.baseUrl}");
    httpClient.addRequestModifier<dynamic>((request) async {
      try {
        print("Request url: ${request.url}");
        // final List<ConnectivityResult> connectivityResult =
        //     await (Connectivity().checkConnectivity());

        // if (!connectivityResult.contains(ConnectivityResult.none)) {
        //   IdTokenResult tokenResult =
        //       await FirebaseAuth.instance.currentUser!.getIdTokenResult();
        //   //   String tokenResult =
        //   //   "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQyZDQ0NGNmOGM1ZTNhZTgzODZkNjZhMTNhMzE2OTc2YWEzNjk5OTEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiNDc0NjE4MTcxMzY5LWM0dnZxcW0wcnM3MHE2MW9wdW9mbjg1ajYzMmlkaTI5LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiNDc0NjE4MTcxMzY5LWM0dnZxcW0wcnM3MHE2MW9wdW9mbjg1ajYzMmlkaTI5LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA5MzA4MTMyMzQ3ODg1NDc2OTI4IiwiZW1haWwiOiJla2FwcmFzZXR5YTIyNDRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJzaVJCcFFqNTZ3aTVrblJtdXJ2NFBBIiwiaWF0IjoxNzI0MDc3MTQwLCJleHAiOjE3MjQwODA3NDB9.mARd28kGxWBeJc5qRFdq1Vq6LqU8huJ1aBqd1hnNH_U55BJ3uxTDvh5IJnTllaKJe6WYSydRLFjC-mDDkVviNQ4rCiDXgHIGBxWaVOLMoOqHHOnnFyc7DabjPS_rjF6UT9nmjmCf3ExkLPjXAwRkg3dY1X6J67k3fwV0rVRPbX1agrMJR1m1nnCgsq7QLIGBmAFRVMqwKSKKJ67Rdl1N6cduqk81ntO6cnHFWahcDind2tixDBB5gWvSST_Y8aZ59elKMvbmpb3u_DROW3ru70LpqaecIH4d9sLTLPvYGgZeFbUekE6RtR7FwpFGK5UJGKbNRxqjdDBhv5O2HVpwXw";

        //   request.headers['Authorization'] = 'Bearer ${tokenResult.token}';
        //   //   request.headers['Authorization'] = 'Bearer $tokenResult';
        //   request.headers['Accept'] = 'application/json';
        // } else {
        //   // CustomSnackBar.error(errorList: [MyStrings.noInternet]);
        //   // throw const SocketException(MyStrings.noInternet);
        //   // return request;
        // }
      } catch (e) {
        log(e.toString());
        // MyUtils.exceptionHandler(e);
      }

      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      if (response.statusCode != 200 && response.statusCode != 201) {
        // handleResponseError(response);
        log(response.body);
      }
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      return request;
    });
  }
}
