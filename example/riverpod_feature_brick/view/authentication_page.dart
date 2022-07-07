import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  
  const AuthenticationPage({Key? key}) : super(key: key);

  /// The static route for AuthenticationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AuthenticationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  } 
}