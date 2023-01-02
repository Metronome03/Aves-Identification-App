import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bird_species_identification_app/auth_pages/first_page.dart';
import 'package:bird_species_identification_app/user_pages/home_page.dart';
import 'package:provider/provider.dart';


class Decider extends StatelessWidget {
  const Decider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);
    print(user);

    if(user==null)
    return FirstPage();
    else
      return HomePage();
  }
}
