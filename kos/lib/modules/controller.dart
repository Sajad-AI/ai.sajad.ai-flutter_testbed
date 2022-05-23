import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/state_manager.dart';

class MyController extends GetxController {
  GlobalKey globalKey = new GlobalKey();

  // RxString jsonString = '{"type": "Container", "width" : 300.0, "child": {"type": "ElevatedButton","color": "##FF00FF", "child" : {"type": "Text","data": "I am a button"}}}'.obs;
  RxString jsonString = ''.obs;

  Future<void> onInit() async {
    super.onInit();
    await getWidgetJSON();
    Uint8List? imageBytes = await _capturePng();
    addImageBytesToDB(imageBytes);
  }

  getWidgetJSON() async {
    CollectionReference tasksCollection = FirebaseFirestore.instance.collection('tasks');
    DocumentSnapshot<Map<String, dynamic>> task = await tasksCollection.doc('pZsLI8G0XABJsztGPUfa').get() as DocumentSnapshot<Map<String, dynamic>>;
    log('sajad getWidgetJSON');
    log(task['widget']);
    jsonString.value = task['widget'];
  }

  Future<void> addImageBytesToDB(Uint8List? imageBytes) async {
    log('sajad addImageBytesToDB: ' + imageBytes.toString());
    CollectionReference imageBytesCollection = FirebaseFirestore.instance.collection('image_bytes');
    imageBytesCollection
        .add({
          'image_bytes': imageBytes,
          'createdAt': DateTime.now(),
        })
        .then((value) => log("Sajad Image Added"))
        .catchError((error) => print("Failed to add Image: $error"));
  }

  Future<Uint8List?> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      print(pngBytes);
      print('png done');
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }
}
