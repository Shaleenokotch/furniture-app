import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:furniture/components/horizontaltext.dart';
import 'package:furniture/components/texttitle.dart';
import 'package:furniture/utils/size_config.dart';

import '../../../utils/constants.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTitle(
              text: "Login",
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 2,
            ),
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 8),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 2,
            ),
            TextFormField(
              obscureText: obscurePass,
              decoration: InputDecoration(
                  filled: true,
                  labelText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePass = !obscurePass;
                        });
                      },
                      icon: obscurePass
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 8),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(color: kPrimaryColor),
                )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(SizeConfig.defaultSize * 1.5)),
                child: Text(
                  'Continue to Login',
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize * 1.6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 2,
            ),
            HorizontalTextLine(height: SizeConfig.defaultSize, label: "Or"),
            SizedBox(
              width: double.infinity,
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
