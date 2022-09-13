import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_cropper_compress_sample/main.dart';
import 'package:image_picker/image_picker.dart';

class ImageManager {
  //これはちり紙交換の「image_picker」：もはや説明はイランでしょう
  Future<File?> pickImage(UploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == UploadType.GALLERY) {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      return (pickedImage != null) ? File(pickedImage.path) : null;
    } else {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      return (pickedImage != null) ? File(pickedImage.path) : null;
    }
  }

  Future<File?> cropImage(File? imageFile) async {
    /*
    * TODO[k] image_cropperは自分で切り取り部分を実装しているわけではないようだ
    *  https://pub.dev/packages/image_cropper#introduction
    *  => MethodChannelを使って、プラットフォームごとに
    *   ・Androidは「uCrop」
    *   ・iOSは「TOCropViewController」
    *   ・Webは「Croppie」
    *   という既存のライブラリにアクセスする仕組みを取っている（うまいね！）
    *   だから、Androidはマニフェストファイルで、切り取り画面用の画面（Activity）の設定が必要なんだってさ
    *   https://pub.dev/packages/image_cropper#android
    *   ＋ image_cropperは圧縮（Compress）も出来るらしいぞ！！
    * */

    if (imageFile == null) return null;
    final imageCropper = ImageCropper();
    final croppedFile = await imageCropper.cropImage(
      sourcePath: imageFile.path,
      //image_cropperは圧縮（Compress）も出来るらしいぞ！！
      // compressQuality: the value 0 - 100 to control the quality of image compression
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 50,
      uiSettings: [
        AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ]
    );
    return (croppedFile == null) ? imageFile : File(croppedFile.path);
  }
}
