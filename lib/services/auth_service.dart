import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<dynamic> getToken() async {
  Map<String, String> allValues = await storage.readAll();
  return allValues['token'] ?? '';
}

Future saveToken(String token) async {
  await storage.write(key: 'token', value: token);
}

Future clearSession() async {
  await storage.deleteAll();
}
