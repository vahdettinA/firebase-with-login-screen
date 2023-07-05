import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/firebase_opsions.dart';
import 'package:loginscreen/theme/mytheme.dart';
import 'package:loginscreen/views/login.dart';

final FirebaseSetting setting = FirebaseSetting();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: setting.apikey,
          appId: setting.appid,
          messagingSenderId: setting.messengerId,
          projectId: setting.projectId));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: MyTheme.backgroundColor,
      ),
      home: const LoginScreen(),
    );
  }
}
