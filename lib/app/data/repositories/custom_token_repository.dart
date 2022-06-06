import 'package:clean_architecture/app/data/providers/functions_provider.dart';

class CustomTokenRepository {
  final String _path = '/createCustomToken';
  FunctionsProvider provider;
  CustomTokenRepository({required this.provider});

  // ! Functions provider 에 path 와 데이터를 넘겨준다. -> functions 에서 만들어진 token 을 받는다.
  Future<String> getCustomToken(Map<String, String> data) async {
    final token = await provider.postRequest(path: _path, data: data);
    return token;
  }
}
