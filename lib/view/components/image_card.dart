import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper_compress_sample/main.dart';
import 'package:image_cropper_compress_sample/view/components_sub/display_image_part.dart';
import 'package:image_cropper_compress_sample/view/components_sub/image_handle_menu_buttons.dart';

class ImageCard extends StatelessWidget {
  final File? imageFile;

  const ImageCard({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: screenWidth * 0.8,
        height: screenHeight * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //画像アイコンと「画像を選択して下さい」をDottedBorderで囲んだ部分
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: DisplayImagePart(
                  imageFile: imageFile,
                ),
              ),
            ),
            //画像を取得ボタン（ギャラリーから・カメラから）
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageHandleMenuButtons(
                imageFile: imageFile,
              ),
            )
          ],
        ),
      ),
    );
  }
}
