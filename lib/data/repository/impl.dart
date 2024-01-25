import 'package:bounce_fit_coach/service/network/client/http_client.dart';
import 'package:bounce_fit_coach/service/network/method/methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../repository/urls.dart';
import '../repository/report.dart';

class Reportimpl implements Report {
  @override
  Future<Response?> getReport(String day, String? searchParam) async {
    try {
      if (searchParam != null) {
        return ApiClient(
            coachAppHttpMethod: CoachAppHttpMethod.get,
            url: 'url',
            headers: {
              "Accept": "application/json",
              "content-type": "application/json",
            }).makeApiCall();
      } else {
        return ApiClient(
            coachAppHttpMethod: CoachAppHttpMethod.get,
            url: 'url',
            headers: {
              "Accept": "applicarion/json",
              "content-type": "application/json",
            }).makeApiCall();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
