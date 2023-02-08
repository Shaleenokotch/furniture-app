import 'package:flutter/material.dart';
import 'package:furniture/screens/login/component/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginWidget(),
    );
  }
}
