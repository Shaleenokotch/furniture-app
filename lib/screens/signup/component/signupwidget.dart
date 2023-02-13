import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:furniture/auth/authenticate.dart';
import 'package:furniture/screens/login/login_screen.dart';

import '../../../components/horizontaltext.dart';
import '../../../components/texttitle.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool obscurePass = true;

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle(
                text: "Sign Up",
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2.5,
              ),
              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide a username";
                  }
                  return null;
                },
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
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide a password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize * 8),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              TextFormField(
                  controller: passwordController,
                  obscureText: obscurePass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please provide a password";
                    }
                    return null;
                  },
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
                          borderSide: BorderSide.none))),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Authenticate().registerUser(
                          emailController.text, passwordController.text, context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.all(SizeConfig.defaultSize * 1.5)),
                  child: Text(
                    'Sign Up',
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
              Row(
                children: [
                  const Text("Already have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false);
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
