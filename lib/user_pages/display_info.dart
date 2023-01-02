import 'package:flutter/material.dart';
import 'package:bird_species_identification_app/user_pages/wiki_wrapper.dart';
import 'package:wikidart/wikidart.dart';

class WikiInformation extends StatelessWidget {
  const WikiInformation({Key? key,required this.name}) : super(key: key);
  final String name;




  @override
  Widget build(BuildContext context) {
    WikiSearch w=WikiSearch();
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Text(name),
    );
  }
}
