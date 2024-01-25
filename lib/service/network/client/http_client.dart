import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:bounce_fit_coach/service/network/method/methods.dart';

class ApiClient {
  ApiClient({
    required this.coachAppHttpMethod,
    required this.url,
    this.headers,
    this.body,
  });
  final CoachAppHttpMethod coachAppHttpMethod;
  final String url;
  final Map<String, String>? headers;
  final Object? body;

  Future<Response?> makeApiCall() async {
    switch (coachAppHttpMethod) {
      case CoachAppHttpMethod.get:
        return await http.get(Uri.parse(url));
      case CoachAppHttpMethod.put:
        return await http.put(Uri.parse(url), body: body, headers: headers);
      case CoachAppHttpMethod.post:
        return await http.post(Uri.parse(url), body: body, headers: headers);
      case CoachAppHttpMethod.delete:
        return await http.delete(Uri.parse(url), headers: headers);
    }
  }
}
