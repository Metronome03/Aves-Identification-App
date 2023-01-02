import 'package:firebase_auth/firebase_auth.dart';

class Authentication
{
  final FirebaseAuth _auth = FirebaseAuth.instance ;


  //listen to auth chaged
  Stream<User?> get user
  {
    return _auth.authStateChanges();
  }

  //user register
  Future userRegister(String email,String password) async
  {
    try
    {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return user;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //user sign in
  Future userSignIn(String email,String password) async
  {
    try
    {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return user;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //anonymous sign-in
  Future anonSignIn() async
  {
    try{
        UserCredential result= await _auth.signInAnonymously();
        User user=result.user!;
        return user;
    }
    catch(e)
    {
        print(e.toString());
        return null;
    }
  }

  //sign out
  Future signOut() async
  {
    try
    {
      return await _auth.signOut();
    }
        catch(e)
    {
      print(e.toString());
      return null;
    }
}
}