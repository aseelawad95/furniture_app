import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 IconButton(icon: Icon(Icons.arrow_back,size: 25,color: Colors.black,), onPressed: () {
                   Navigator.of(context).pop();
                 },),
                Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  IconButton(onPressed:(){
                  },
                      icon:(isDark ? Icon(Icons.brightness_4,color: Colors.black,) : Icon(Icons.brightness_2,color: Colors.black,))),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image:AssetImage('assets/images/profile_image.png') )
                  ),
                  ),
              SizedBox(height: 10,),
              Text('aseelawad@gmail.com',style: TextStyle(color: Colors.black,fontSize: 15),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){

              }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                shape: StadiumBorder(),
                fixedSize: Size(200,50)
              ),
                  child: Text('Edit Profile',style: TextStyle(color: Colors.black,fontSize: 15),)),
              SizedBox(height: 20,),
              ListTile(leading: Icon(Icons.settings,color: Colors.black,),
                title: Text('Setting',style: TextStyle(color: Colors.black,fontSize: 15),),
                trailing: IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
              ),),
              ListTile(leading: Icon(Icons.info,color: Colors.black,),
                title: Text('Information',style: TextStyle(color: Colors.black,fontSize: 15),),
                trailing: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                ),),
              ListTile(leading: Icon(Icons.notifications,color: Colors.black,),
                title: Text('Notifications',style: TextStyle(color: Colors.black,fontSize: 15),),
                trailing: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                ),),
              ListTile(leading: Icon(Icons.security,color: Colors.black,),
                title: Text('Security',style: TextStyle(color: Colors.black,fontSize: 15),),
                trailing: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                ),),
              Text('Log Out',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}

