import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadImageService{
  Future<String?> uploadImage(File imageFile, String imageName) async {
  try {
    final storageRef = FirebaseStorage.instance.ref().child('images/$imageName');
    final uploadTask = storageRef.putFile(imageFile);

    final TaskSnapshot snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  } catch (e) {
  debugPrint('Error uploading image: $e');
    return null;
  }
}
}