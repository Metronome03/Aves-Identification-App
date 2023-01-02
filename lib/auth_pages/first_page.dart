import 'package:flutter/material.dart';
import 'package:bird_species_identification_app/auth_pages/register_page.dart';
import 'package:bird_species_identification_app/auth_pages/login_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage("assets/first_page_image.jpeg"),
            fit:BoxFit.cover,
          ),
        ),
        child:Center(
          child:Container(
            color:Colors.transparent,
            child:Column(
              children: <Widget>[
                SizedBox(height: 300.0),
                Text(
                  "GARUDA",
                  style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Aves Identification",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30,color: Colors.white),
                ),
                SizedBox(height:100.0),
                ElevatedButton(onPressed: ()
                {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginPage()));
                },
                    child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 170,vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                    ),
                ),
                SizedBox(height: 75.0),
                Text(
                  "Are you a new user?",
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color:Colors.white),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(onPressed: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const RegisterPage()));
                }, 
                    child: Text(
                      "Register Here",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.white),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )
                ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
