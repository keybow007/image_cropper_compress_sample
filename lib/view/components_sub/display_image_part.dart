import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class DisplayImagePart extends StatelessWidget {
  final File? imageFile;

  const DisplayImagePart({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageFile == null)
        //TODO[k] 点線枠（dotted_borderパッケージ）
        //https://pub.dev/packages/dotted_border#usage
        ? DottedBorder(
            radius: Radius.circular(12.0),
            //https://pub.dev/packages/dotted_border#bordertypes
            borderType: BorderType.RRect,
            //https://pub.dev/packages/dotted_border#dash-pattern
            dashPattern: [8, 4],
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: screenWidth * 0.8 * 0.4),
                  Text("画像を選んでください"),
                ],
              ),
            ),
          )
        : SizedBox(
            //TODO[k]枠内いっぱいに拡げようと思ったらBoxFit.coverだけではダメでSizedBox#double.infinityも必要
            width: double.infinity,
            child: Image.file(
              imageFile!,
              //TODO[k] ここは好きにしてちょ
              //https://api.flutter.dev/flutter/painting/BoxFit.html
              //fit: BoxFit.cover,
            ),
          );
  }
}
