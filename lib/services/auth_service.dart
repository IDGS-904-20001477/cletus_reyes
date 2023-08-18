import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<dynamic> getUser() async {
  Map<String, String> allValues = await storage.readAll();
  return jsonDecode(allValues['user'] ?? '{}') as Map;
}

Future saveUser(String userAuth) async {
  await storage.write(key: 'user', value: userAuth);
}

Future clearSession() async {
  await storage.deleteAll();
}
