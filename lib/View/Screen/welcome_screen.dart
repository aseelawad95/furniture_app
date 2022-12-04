import 'package:flutter/material.dart';
import 'package:furniture/View/Screen/cart_screen.dart';
import 'package:furniture/View/Screen/favorite_screen.dart';
import 'package:furniture/View/Screen/Profile/profile_screen.dart';

import 'home_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  void updateMenuIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
       // backgroundColor: Colors.grey,
            onTap: updateMenuIndex,
         items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black87,),label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_border,color: Colors.black87,),label: 'Favorite'),
           BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,color: Colors.black87,),label: 'profile'),
         ],
       ),
    );
  }
}
