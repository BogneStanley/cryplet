import 'dart:io';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageHandler {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickFromGallery() async {
    return _pickAndCropImage(source: ImageSource.gallery);
  }

  static Future<File?> pickFromCamera() async {
    return _pickAndCropImage(source: ImageSource.camera);
  }

  static Future<File?> _pickAndCropImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) {
        return null;
      }

      // Crop the image to a square aspect ratio
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio:
            const CropAspectRatio(ratioX: 1, ratioY: 1), // Square aspect ratio
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: AppColors.primary,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: true,
          )
        ],
      );

      if (croppedFile == null) {
        return null;
      }

      return File(croppedFile.path);
    } catch (e) {
      debugPrint('Error picking and cropping image: $e');
      return null;
    }
  }
}
