import 'dart:io';
import 'package:tflite/tflite.dart';

class Prediction
{
  Future loadModel() async
  {
    Tflite.close();
    String res = (await Tflite.loadModel(model: "assets/scripts/birds_450_quant_image_inceptionV3_metadata.tflite",
    labels: "assets/scripts/labels_450.txt"))!;
    print("Model loading status : ${res}");
  }
  Future imageClassification(File image) async
  {
    final List? recognitions = await Tflite.runModelOnImage(path: image.
    path,numResults: 6,
    threshold: 0.05,
    imageMean: 127.5,
    imageStd: 127.5);
    return recognitions;
  }
}