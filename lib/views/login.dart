import 'package:flutter/material.dart';

import 'package:loginscreen/companents/mytextfield.dart';
import 'package:loginscreen/service/auth_service.dart';
import 'package:loginscreen/theme/mytheme.dart';
import 'package:loginscreen/views/home.dart';
import 'package:loginscreen/views/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "LOGİN",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyTheme.textColor, fontWeight: FontWeight.bold),
            ),
            MyTextfield(
              hintext: "e-mail",
              icon: Icons.mail,
              obscuretext: false,
              controller: _emailController,
            ),
            MyTextfield(
              hintext: "paswword",
              icon: Icons.lock,
              obscuretext: true,
              controller: _passwordController,
            ),
            _singinButton(),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text(
                  "Register",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.textColor, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  Widget _singinButton() {
    return InkWell(
      onTap: () {
        _authService
            .singin(_emailController.text, _passwordController.text)
            .then((value) {
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
      },
      child: Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        child: Text(
          "Login",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: MyTheme.textColor2, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyTheme.textfieldColor,
        ),
      ),
    );
  }
}
