
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture/View/Screen/welcome_screen.dart';

import '../../../Core/Router/router_constant.dart';
import '../../../Core/Service/connectivity_service.dart';
import '../../../Core/Service/user_service.dart';
import '../../Component/internet_connection_dailog.dart';
import '../../Component/loader.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService _userService = UserService();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  final formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
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
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed(welcomeScreen);
                validateAndSubmit(context);
                if (formKey.currentState!.validate()) {
                  print(
                      'Login Succeeded with : ${email.text} and ${password.text} and ${userName.text}');
                } else {
                  print('Wrong or Empty Input');
                }

              },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  fixedSize: Size(120, 50)),
                  child: Text('Login',
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
        var result = await _userService.signIn(
            email.text.trim(), password.text.trim());
        Navigator.of(_keyLoader.currentContext ?? context, rootNavigator: true)
            .pop();
        if (result == 'No user found for that email.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('No user found for this email.'),
          ));
        } else if (result == 'Wrong password provided for that user.') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password provided for this user.'),
          ));
        } else {
          log('uid2 : $result');
          final UserService _service = UserService();
          var userData = await _service.getUserData(result);
          if (userData != null) {
            Navigator.pushNamed(context, welcomeScreen, arguments: userData);
          }
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


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   Artboard? riveArtboard;
//   late RiveAnimationController controllerIdle;
//   late RiveAnimationController controllerHandsUp;
//   late RiveAnimationController controllerHandsDown;
//   late RiveAnimationController controllerLookLeft;
//   late RiveAnimationController controllerLookRight;
//   late RiveAnimationController controllerSuccess;
//   late RiveAnimationController controllerFail;
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String testEmail = "omar@gmail.com";
//   String testPassword = "123456";
//   final passwordFocusNode = FocusNode();
//
//   bool isLookingLeft = false;
//   bool isLookingRight = false;
//
//   void removeAllControllers() {
//     riveArtboard?.artboard.removeController(controllerIdle);
//     riveArtboard?.artboard.removeController(controllerHandsUp);
//     riveArtboard?.artboard.removeController(controllerHandsDown);
//     riveArtboard?.artboard.removeController(controllerLookLeft);
//     riveArtboard?.artboard.removeController(controllerLookRight);
//     riveArtboard?.artboard.removeController(controllerSuccess);
//     riveArtboard?.artboard.removeController(controllerFail);
//     isLookingLeft = false;
//     isLookingRight = false;
//   }
//
//   void addIdleController() {
//     removeAllControllers();
//     riveArtboard?.artboard.addController(controllerIdle);
//     debugPrint("idleee");
//   }
//
//   void addHandsUpController() {
//     removeAllControllers();
//     riveArtboard?.artboard.addController(controllerHandsUp);
//     debugPrint("hands up");
//   }
//
//   void addHandsDownController() {
//     removeAllControllers();
//     riveArtboard?.artboard.addController(controllerHandsDown);
//     debugPrint("hands down");
//   }
//
//   void addSuccessController() {
//     removeAllControllers();
//     riveArtboard?.artboard.addController(controllerSuccess);
//     debugPrint("Success");
//   }
//
//   void addFailController() {
//     removeAllControllers();
//     riveArtboard?.artboard.addController(controllerFail);
//     debugPrint("Faillll");
//   }
//
//   void addLookRightController() {
//     removeAllControllers();
//     isLookingRight = true;
//     riveArtboard?.artboard.addController(controllerLookRight);
//     debugPrint("Righttt");
//   }
//
//   void addLookLeftController() {
//     removeAllControllers();
//     isLookingLeft = true;
//     riveArtboard?.artboard.addController(controllerLookLeft);
//     debugPrint("Leftttttt");
//   }
//
//   void checkForPasswordFocusNodeToChangeAnimationState() {
//     passwordFocusNode.addListener(() {
//       if (passwordFocusNode.hasFocus) {
//         addHandsUpController();
//       } else if (!passwordFocusNode.hasFocus) {
//         addHandsDownController();
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
//     controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
//     controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
//     controllerLookRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
//     controllerLookLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
//     controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
//     controllerFail = SimpleAnimation(AnimationEnum.fail.name);
//     rootBundle.load(
//         'assets/images/animated_login_screen.riv').then((data) async{
//       final file = RiveFile.import(data);
//       final artboard = file.mainArtboard;
//       artboard.addController(controllerIdle);
//       setState(() {
//         riveArtboard = artboard;
//       });
//     });
//
//     checkForPasswordFocusNodeToChangeAnimationState();
//   }
//
//   void validateEmailAndPassword() {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (formKey.currentState!.validate()) {
//         addSuccessController();
//       } else {
//         addFailController();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height/3,
//                 child: riveArtboard == null
//                     ? const SizedBox.shrink()
//                     : Rive(
//                   artboard: riveArtboard!,
//                 ),
//               ),
//               Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         labelStyle: TextStyle(color: Colors.black),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 3,
//                           ),
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                       ),
//                       validator: (value) =>
//                       value != testEmail ? "Wrong email" : null,
//                       onChanged: (value) {
//                         if (value.isNotEmpty &&
//                             value.length < 16 &&
//                             !isLookingLeft) {
//                           addLookLeftController();
//                         } else if (value.isNotEmpty &&
//                             value.length > 16 &&
//                             !isLookingRight) {
//                           addLookRightController();
//                         }
//                       },
//                     ),
//                     SizedBox(
//                       height: 10 ,
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         labelStyle: TextStyle(color: Colors.black),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width:3,
//                           ),
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                       ),
//
//                       focusNode: passwordFocusNode,
//                       validator: (value) =>
//                       value != testPassword ? "Wrong password" : null,
//                     ),
//                     SizedBox(
//                       height:20,
//                     ),
//                     Container(
//                       //width: double.infinity,
//                       // padding: EdgeInsets.symmetric(
//                       //   horizontal: MediaQuery.of(context).size.width ,
//                       // ),
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           fixedSize: Size(200, 60),
//                           shape: const StadiumBorder(),
//                           backgroundColor: Colors.black,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                         ),
//                         onPressed: () {
//                           passwordFocusNode.unfocus();
//
//                           validateEmailAndPassword();
//                         },
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }