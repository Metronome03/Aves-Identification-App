import 'package:flutter/material.dart';
import 'package:bird_species_identification_app/auth_pages/auth.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:bird_species_identification_app/user_pages/prediction.dart';
import 'wikipedia.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () async
            {
              await _auth.signOut();
            },
            child: Text(
              "Sign Out",
              style: TextStyle(),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        color: Colors.pink[50],
        child: HomePageStuff(),
      )
    );
  }
}

class HomePageStuff extends StatefulWidget {
  const HomePageStuff({Key? key}) : super(key: key);

  @override
  State<HomePageStuff> createState() => _HomePageStuffState();
}

class _HomePageStuffState extends State<HomePageStuff> {

  final Prediction pred= Prediction();
  File? imageFile;
  Future pickGallery() async
  {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;
    final imageTemp=File(image.path);
    setState(()=>this.imageFile=imageTemp);
  }
  Future pickCamera() async
  {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image==null) return;
    final imageTemp=File(image.path);
    setState(()=>this.imageFile=imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 400.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: imageFile!=null?Image.file(imageFile!,width: 400.0,height: 400.0):null,
                  ),
                  SizedBox(height: 20.0),
                  if(imageFile!=null)
                  ElevatedButton(onPressed: () async
                      {
                        print("Predicting");
                        pred.loadModel();
                        final List res= await pred.imageClassification(imageFile!);
                        String name=res[0]['label'];

                        print(name);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> Wikipedia(name: name)));
                      },
                      child: Text(
                        "PREDICT",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[700],
                        padding: EdgeInsets.symmetric(horizontal: 150,vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                      ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Select Image From",
              style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25, ),
            ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(onPressed: ()
              {
                pickGallery();
              },
                  child: Text(
                    "GALLERY",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
                padding: EdgeInsets.symmetric(horizontal: 30,vertical:15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0,),
                  ),
              ),),
              Text("/",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60)),
              ElevatedButton(onPressed: ()
              {
                pickCamera();
              },
                  child: Text(
                    "CAMERA",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
                padding: EdgeInsets.symmetric(horizontal: 30,vertical:15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0,),
                )
              ),)
            ],
          ),
        ],
      ),
    );
  }
}

