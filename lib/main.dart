
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/Provider/cart_provider.dart';
import 'Core/Router/router.dart';
import 'Core/Router/router_constant.dart';
import 'View/Screen/Auth/login_screen.dart';
import 'View/Screen/Auth/sign_up_screen.dart';
import 'View/Screen/Profile/profile_screen.dart';
import 'View/Screen/detial_screen.dart';
import 'View/Screen/welcome_page.dart';
import 'View/Screen/welcome_screen.dart';
import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Prefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // var uid = Prefs.getStringValue("uid");
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider.value(value: CartProvider()),
    ],
      child: MaterialApp(
        title: 'Furniture App',
        home: WelcomeScreen(
        ),
        debugShowCheckedModeBanner: false,
         onGenerateRoute: MyRouter.generateRoute,
         initialRoute:welcomepage2,
      ),
    );
  }
}