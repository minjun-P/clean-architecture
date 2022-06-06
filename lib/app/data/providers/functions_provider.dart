import 'package:http/http.dart' as http;

class FunctionsProvider {
  String baseUrl =
      'https://asia-northeast3-mj-clean-architecture.cloudfunctions.net';

  Future<String> postRequest(
      {required String path, required Map<String, String> data}) async {
    http.Response response =
        await http.post(Uri.parse(baseUrl + path), body: data);
    return response.body;
  }
}
