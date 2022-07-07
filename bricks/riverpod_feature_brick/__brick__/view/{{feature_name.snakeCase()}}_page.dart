import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  
  const {{feature_name.pascalCase()}}Page({Key? key}) : super(key: key);

  /// The static route for {{feature_name.pascalCase()}}Page
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const {{feature_name.pascalCase()}}Page());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  } 
}