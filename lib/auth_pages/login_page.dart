import 'package:flutter/material.dart';
import 'package:bird_species_identification_app/auth_pages/auth.dart';
import 'package:bird_species_identification_app/loading.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email="";
  String password="";
  String error="Invalid Credentials";
  int err=0;
  final Authentication _auth = Authentication();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
        resizeToAvoidBottomInset: false,
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/login_page_image1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              color: Colors.transparent,
              child:Form(
                key:_formKey,
                child:Column(
                  children: <Widget>[
                    SizedBox(height: 160.0),
                    Text(
                      "SIGN IN",
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
                    if(err>0)
                    Column(
                      children: <Widget>[SizedBox(height: 20.0),
                      Text(error,style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0,color: Colors.red[800]))],),
                    SizedBox(height:30.0),
                    ElevatedButton(onPressed: () async
                    {
                      if(_formKey.currentState!.validate())
                      {
                        setState(()=>loading=true);
                        dynamic result = await _auth.userSignIn(email, password);
                        if(result==null)
                          setState(()
                          {
                            err++;
                            loading=false;
                          });
                      }
                    },
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 180,vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(onPressed:() async
                    {
                      setState(()=>loading=true);
                      dynamic result=await _auth.anonSignIn();
                      if(result==null) {
                        print("Error signing in");
                        setState(()=>loading=false);
                      }
                      else
                      {
                        print("User signed in");
                        print(result);
                      }
                    },
                      child: Text(
                        "Sign In Anonymously",
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
