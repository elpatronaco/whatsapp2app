import 'package:http/http.dart' as http;

class ApiHelper {
  final baseurl = "https://localhost:5001";

  Future<dynamic> get(final String endpoint) async {
    try {
      final res = await http.get(Uri.http(baseurl, endpoint));
      return _parseResponse(res);
    } on Exception {
      throw Exception();
    }
  }

  Future<dynamic> post(final String endpoint, {Object? body}) async {
    try {
      final res = await http.post(Uri.http(baseurl, endpoint), body: body);
      return _parseResponse(res);
    } on Exception {
      throw Exception();
    }
  }

  dynamic _parseResponse(http.Response resp) {
    var code = resp.statusCode;

    if (code >= 200 && code < 300) {
      return resp.body;
    } else if (code == 400) {
      throw new ArgumentError(resp.body);
    } else {
      throw new Exception(resp.body);
    }
  }
}
