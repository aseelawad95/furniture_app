
import 'package:flutter/material.dart';
import 'package:furniture/Core/Models/route_model.dart';
import 'package:furniture/Core/Router/router_constant.dart';
import 'package:furniture/Core/Router/un_defined_route.dart';
import 'package:furniture/View/Screen/Auth/sign_up_screen.dart';
import 'package:furniture/View/Screen/cart_screen.dart';
import 'package:furniture/View/Screen/chair_screen.dart';
import 'package:furniture/View/Screen/home_screen.dart';
import 'package:furniture/View/Screen/welcome_page.dart';
import 'package:furniture/View/Screen/welcome_screen.dart';
import '../../View/Screen/Auth/login_screen.dart';
import '../../View/Screen/armchair_screen.dart';
import '../../View/Screen/detial_screen.dart';
import '../../View/Screen/favorite_screen.dart';
import '../../View/Screen/sofa_screen.dart';


class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        {
          return _route(WelcomeScreen());
        }

      case homepage:
        {
          return _route(HomeScreen());
        }


      case favoritePage:
        {
          return _route(FavoriteScreen());
        }
      case sofaScreen : {
        return _route(SofaScreen());
      }
      case armchairScreen : {
        return _route(ArmchairScreen());
      }
      case chairScreen :{
        return _route(ChairScreen());
      }
      case loginPage:
        {
          return _route(LoginScreen());
        }
      case signUpRoute:
        {
          return _route(SignUpScreen());
        }

      // case splash:
      // {
      //   return _route(SplashScreen());
      // }
      case welcomepage2:{
        return _route(WelcomePage());
      }
      case detailPage:
        {
         // final arg = settings.arguments as int;
          return _route(DetailScreen(itemId: 1,));
        }
      case cartItemRout:
        {
           final arg = settings.arguments as RouteModel ;

           return _route(CartScreen(model: arg,));
        }

      default:
        {
          return _route(UndefinedRoute(
            routName: settings.name!,
          ));
        }
    }
  }

  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}