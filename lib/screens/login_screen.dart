import 'dart:convert';

import 'package:cletus_reyes/services/auth_service.dart';
import 'package:cletus_reyes/themes/app_themes.dart';
import 'package:cletus_reyes/util/api_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo_cletus.png'),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 14.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  focusColor: AppThemes.primary,
                  hoverColor: AppThemes.primary),
            ),
            const SizedBox(height: 22.0),
            if (errorMessage != '')
              Text(
                errorMessage,
                style: TextStyle(color: AppThemes.primary),
              ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () async {
                // Add your login logic here

                setState(() {
                  errorMessage = '';
                });
                try {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  var user = await postLogin(email: email, password: password);
                  saveUser(user);
                  //saveToken(user.)
                  Navigator.pushNamed(context, '/products');
                } catch (e) {
                  setState(() {
                    errorMessage = "Correo o contraseña incorrecta";
                  });
                }

                //print('Email: $email, Password: $password');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 16, bottom: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                backgroundColor: AppThemes.primary,
              ),
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

Future postLogin({required String email, required String password}) async {
  var res = await http.post(
    Uri.parse("$API_URL/Auth/Login"),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
    body: json.encode({'email': email, 'password': password}),
  );
  if (res.statusCode >= 200 && res.statusCode < 300) {
    return res.body;
  } else {
    throw res.body;
  }
}
