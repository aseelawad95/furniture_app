import 'package:flutter/material.dart';

import '../../Core/Router/router_constant.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                      image:AssetImage('assets/images/image_fu.png'),
                  )
                ),
              ),
            ),
            SizedBox(height: 13,),
            Padding(padding: EdgeInsets.all(15),
            child:  Text('Explore top furniture brands for you',style: TextStyle(
              color: Colors.black,
              fontSize: 33,
              fontWeight: FontWeight.bold
            ),)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed(signUpRoute);

            },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fixedSize: Size(120, 50)),
                child: Text('Sign up',
                style: TextStyle(fontSize: 18),)),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed(loginPage);

            },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                fixedSize: Size(120, 50)),
                child: Text('Login',style: TextStyle(fontSize: 18),)),


          ],
        ),
      ),
    );
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