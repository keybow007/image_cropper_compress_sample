import 'package:flutter/material.dart';
import 'package:image_cropper_compress_sample/main.dart';
import 'package:image_cropper_compress_sample/view/components/image_card.dart';
import 'package:image_cropper_compress_sample/view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<ViewModel>(
        builder: (context, vm, child) {
          final imageFile = vm.imageFile;
          final isProcessing = vm.isProcessing;
          return Center(
            child: (isProcessing)
                ? CircularProgressIndicator()
                : ImageCard(
                        imageFile: imageFile,
                      ),
          );
        },
      ),
    );
  }
}
