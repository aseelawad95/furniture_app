import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../Core/Router/router_constant.dart';
import '../../../Core/Service/connectivity_service.dart';
import '../../../Core/Service/user_service.dart';
import '../../Component/internet_connection_dailog.dart';
import '../../Component/loader.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserService _userService = UserService();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 270.0,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/image_fu.png'),)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter Your name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* required';
                      //
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* required';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    } else if (value.length > 15) {
                      return "Password should not be greater than 15 characters";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                validateAndSubmit(context);
                Navigator.of(context).pushNamed(loginPage);
                if (formKey.currentState!.validate()) {
                  print(
                      'Login Succeeded with : ${email.text} and ${password.text} and ${name.text}');
                } else {
                  print('Wrong or Empty Input');
                }

              },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  fixedSize: Size(120, 50)),
                  child: Text('Sign up',
                    style: TextStyle(fontSize: 18),)),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
  bool emailValidator(String str) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(str);
  }
  void validateAndSubmit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (await ConnectivityService.checkInternetConnectivity()) {
        Loader.showLoadingScreen(context, _keyLoader);
        log('email : ${email.text.trim()} | password : ${password.text.trim()}');
        var userValues = HashMap();
        userValues['email'] = email.text.trim();
        userValues['name'] = name.text.trim();
        userValues['password'] = password.text.trim();
        var result = await _userService.signUp(userValues);
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'The password provided is too weak.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The password provided is too weak.'),
          ));
        } else if (result == 'The account already exists for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.'),
          ));
        } else {
          log('uid2 : $result');
          Navigator.of(context).pushNamed(loginPage,arguments: result);
        }
      } else {
        internetConnectionDialog(context);
      }
    }
  }
}
class MyClipper  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 90);
    var controllPoint = Offset(70,size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}