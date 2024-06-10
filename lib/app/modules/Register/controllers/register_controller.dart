import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/app/data/UserModels.dart';

class RegisterController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  //inisialisasi controller
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //Register dengan email dan password
  Future<User?> signUpWithEmailAndPassword() async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offNamed('/login');
      return credential.user;
    } catch (e) {
      Get.snackbar("Error", "Error $e");
    }
    return null;
  }

  //Insert data ke firebase
void insertData() {
  // Add a new document with a generated id.
  String email = emailController.text;
  String name = nameController.text;
  String address = addressController.text;
  String phoneNumber = phoneNumberController.text;
  String password = passwordController.text;
  String confirmPassword = confirmPasswordController.text;

  // Check if all fields are filled
  if (email.isEmpty ||
      name.isEmpty ||
      address.isEmpty ||
      phoneNumber.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty) {
    Get.snackbar("Error", "Harap isi semua inputan");
    // You can also show a dialog or snackbar to notify the user
    return;
  }

  final newUser = UserModel(
    email: email,
    name: name,
    address: address,
    phoneNumber: phoneNumber,
    password: password,
    confirmPassword: confirmPassword,
  );

  FirebaseFirestore.instance.collection("users").doc(email).set({
    'email': newUser.email,
    'name': newUser.name,
    'address': newUser.address,
    'phoneNumber': newUser.phoneNumber,
    'password': newUser.password,
    'confirmPassword': newUser.confirmPassword,
  }).then((documentReference) {
    print("Data Added with ID: $email");
  }).catchError((error) {
    print("Failed to add data: $error");
  });
}


  //Get profil pengguna

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
