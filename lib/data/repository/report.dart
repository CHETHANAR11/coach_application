import 'package:http/http.dart';

abstract class Report {
  Future<Response?> getReport(String day,String? searchParam);
}
