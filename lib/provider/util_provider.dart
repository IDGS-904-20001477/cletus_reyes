import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UtilProvider extends ChangeNotifier {
  static final UtilProvider rtp = UtilProvider._();
  UtilProvider._();

  final storage = const FlutterSecureStorage();

  Future responsehttp({required String urlBase}) async {
    var response = await http.get(Uri.parse(urlBase));
    return response;
  }

  Future checkSession() async {
    Map<String, String> allValues = await storage.readAll();
    return allValues['inSesion'] == '1' ? 1 : 0;
  }

  Future saveStorage(
      {required String usuario, required String password}) async {
    await storage.write(key: 'Usuario', value: usuario);
    await storage.write(key: 'psw', value: password);
    await storage.write(key: 'inSesion', value: '1');
    return 1;
  }

  Future clearSession() async {
    await storage.deleteAll();
  }
}
