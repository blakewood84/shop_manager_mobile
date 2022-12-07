import 'package:flutter/material.dart';
import 'package:shop_manager_mobile/authentication/check_authentication.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const CheckAuthentication(),
    );
  }
}