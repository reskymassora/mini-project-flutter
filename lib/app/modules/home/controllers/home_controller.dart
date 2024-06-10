import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  // State untuk menyimpan URL gambar
  var imageUrl = "".obs;
  RxString email = ''.obs;

  // Observable variables for user data
  var userName = ''.obs;
  var userPhoneNumber = ''.obs;
  var userAddress = ''.obs;

  @override
  void onInit() {
    super.onInit();
    email.value = Get.arguments['email'];
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(email.value).get();
      if (userDoc.exists) {
        userName.value = userDoc['name'];
        userPhoneNumber.value = userDoc['phoneNumber'];
        userAddress.value = userDoc['address'];
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data: $e");
    }
  }

  // Method untuk memilih gambar dari galeri atau kamera
  Future<void> pickImageFrom(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    // Pick image
    final XFile? image = await picker.pickImage(source: source);

    // Handle image selection
    if (image != null) {
      final file = File(image.path);
      try {
        // Show progress bar
        Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );

        // Create reference to Firebase Storage bucket
        final storageRef = FirebaseStorage.instance
            .ref()
            .child("images/${file.uri.pathSegments.last}");

        // Upload file and metadata to 'images/' path
        await storageRef.putFile(file);

        // Get download URL
        String downloadUrl = await storageRef.getDownloadURL();

        // Update state with the new image URL
        imageUrl.value = downloadUrl;

        // Hide progress bar (success case)
        Get.back();

        // Show success message
        Get.snackbar("Success", "Image uploaded successfully!");
      } on FirebaseException catch (e) {
        // Hide progress bar (error case)
        Get.back();

        // Show error message
        Get.snackbar("Error", e.message ?? "An error occurred");
      } catch (e) {
        // Hide progress bar (other errors)
        Get.back();

        // Show generic error message
        Get.snackbar("Error", "An unexpected error occurred");
      }
    } else {
      // Close page or go back if no image is selected
      Get.back();
    }
  }

  // Method untuk memunculkan dialog pilihan pengambilan gambar
  void uploadPicture() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      title: Text(
        "Upload from?",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: [
        TextButton(
          onPressed: () {
            pickImageFrom(ImageSource.gallery);
            Get.back(); // Tutup dialog setelah memilih gambar
          },
          child: Text("Gallery"),
        ),
        TextButton(
          onPressed: () {
            pickImageFrom(ImageSource.camera);
            Get.back(); // Tutup dialog setelah memilih gambar
          },
          child: Text("Camera"),
        ),
      ],
    ));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
