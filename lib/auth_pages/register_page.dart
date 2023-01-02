import 'package:flutter/material.dart';
import 'package:bird_species_identification_app/auth_pages/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email="";
  String password="";
  String password1="";
  final Authentication _auth = Authentication();
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/register_page_image.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.transparent,
            child:Form(
              key:_formKey ,
              child:Column(
                children: <Widget>[
                  SizedBox(height: 160.0),
                  Text(
                    "REGISTER",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),
                  ),
                  SizedBox(height:50.0),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Enter E-maid ID",
                    ),
                    onChanged: (value)
                    {
                      email=value;
                    },
                    validator: (value)=>value!.isEmpty ? "Enter an email" : null,
                  ),
                  SizedBox(height:20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Enter password",
                    ),
                    obscureText: true,
                    onChanged: (value)
                    {
                      password=value;
                    },
                    validator: (value)=>value!.length<8 ? "Enter a password with atleast 8 characters" : null,
                  ),
                  /*SizedBox(height:20.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Confirm password",

                  ),
                  obscureText: true,
                  onChanged: (value)
                  {
                    password1=value;
                  },
                ),*/
                  SizedBox(height:20.0),
                  ElevatedButton(onPressed: () async
                  {
                    if(_formKey.currentState!.validate())
                      {
                        dynamic result = await _auth.userRegister(email, password);
                      }
                  },
                    child: Text(
                      "Click here to register",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
