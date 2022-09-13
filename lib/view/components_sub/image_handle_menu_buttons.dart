import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../view_model.dart';

class ImageHandleMenuButtons extends StatelessWidget {
  final File? imageFile;

  const ImageHandleMenuButtons({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: (imageFile == null) ? [
        ElevatedButton.icon(
          icon: Icon(Icons.image),
          label: Text("ギャラリー"),
          onPressed: () => _pickImage(context, UploadType.GALLERY),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.camera_alt),
          label: Text("カメラ"),
          onPressed: () => _pickImage(context, UploadType.CAMERA),
        ),
      ] : [
        ElevatedButton.icon(
          icon: Icon(Icons.delete),
          label: Text("削除"),
          onPressed: () => _deleteImage(context),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.crop),
          label: Text("切り取り"),
          onPressed: () => _cropImage(context),
        ),
      ],
    );
  }

  _pickImage(BuildContext context, UploadType uploadType) {
    final vm = context.read<ViewModel>();
    vm.pickImage(uploadType);
  }

  _deleteImage(BuildContext context) {
    final vm = context.read<ViewModel>();
    vm.deleteImage();
  }

  _cropImage(BuildContext context) {
    final vm = context.read<ViewModel>();
    vm.cropImage();
  }
}
