import 'package:flutter/material.dart';
import 'package:furniture/screens/login/component/login_widget.dart';
import 'package:furniture/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: const LoginWidget(),
    );
  }
}
