import 'package:flutter/material.dart';

import 'package:loginscreen/service/auth_service.dart';
import 'package:loginscreen/theme/mytheme.dart';
import 'package:loginscreen/views/login.dart';

class Home extends StatelessWidget {
  Home({super.key});
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hoşgeldiniz"),
            _singoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _singoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        _authService.singout().then((value) {
          return Navigator.pop(context);
        });
      },
      child: Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        child: Text(
          "Sing out",
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
