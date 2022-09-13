import 'package:flutter/material.dart';
import 'package:image_cropper_compress_sample/view/screens/home_screen.dart';
import 'package:image_cropper_compress_sample/view_model.dart';
import 'package:provider/provider.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;

enum UploadType {
  GALLERY,
  CAMERA,
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
