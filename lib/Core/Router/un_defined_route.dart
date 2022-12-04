import 'package:flutter/material.dart';

class UndefinedRoute extends StatelessWidget {
  const UndefinedRoute({Key? key, required this.routName}) : super(key: key);
  final String routName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This $routName is undefined route\nplease go back and make sure the you\n'
              'navigate to right page',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}