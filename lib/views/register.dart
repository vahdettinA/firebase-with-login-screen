import 'package:flutter/material.dart';

import 'package:loginscreen/companents/mytextfield.dart';
import 'package:loginscreen/service/auth_service.dart';
import 'package:loginscreen/theme/mytheme.dart';
import 'package:loginscreen/views/home.dart';
import 'package:loginscreen/views/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
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
              "Register",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyTheme.textColor, fontWeight: FontWeight.bold),
            ),
            MyTextfield(
              hintext: "name",
              icon: Icons.person,
              obscuretext: false,
              controller: _nameController,
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
            _registerButton(),
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return InkWell(
      onTap: () {
        _authService
            .createUser(_nameController.text, _emailController.text,
                _passwordController.text)
            .then((value) {
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      },
      child: Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        child: Text(
          "Sing up",
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
