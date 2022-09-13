import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper_compress_sample/image_manager.dart';
import 'package:image_cropper_compress_sample/main.dart';

class ViewModel extends ChangeNotifier {
  final imageManager = ImageManager();

  //Crop前はimage_pickerで取得した画像、Crop後はCropしたあとの画像
  File? imageFile;

  bool isProcessing = false;


  Future<void> pickImage(UploadType uploadType) async {
    imageFile = null;
    this.isProcessing = true;
    notifyListeners();

    imageFile = await imageManager.pickImage(uploadType);

    this.isProcessing = false;
    notifyListeners();
  }

  Future<void> cropImage() async {
    imageFile = await imageManager.cropImage(imageFile);
    notifyListeners();
  }

  void deleteImage() {
    imageFile = null;
    notifyListeners();
  }


}