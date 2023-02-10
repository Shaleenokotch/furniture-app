import 'package:flutter/material.dart';
import 'package:furniture/screens/signup/component/signupwidget.dart';
import 'package:furniture/utils/size_config.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: const SignUpWidget(),
    );
  }
}
