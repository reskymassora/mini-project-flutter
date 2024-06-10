import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Terjadi kesalahan", "Email atau password tidak boleh kosong ");
      return;
    }

    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.back();

      Get.toNamed('/home', arguments: {'email': email});
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "Pengguna tidak ditemukan");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Kata sandi salah");
      } else {
        Get.snackbar("Error", "Terjadi kesalahan: ${e.code}");
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "Terjadi kesalahan tak terduga");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
