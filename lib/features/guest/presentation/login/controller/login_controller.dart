import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_indo_app/common/route/app_route.dart';
import 'package:news_indo_app/features/guest/domain/entities/user.dart';
import 'package:news_indo_app/features/guest/domain/usecase/get_current_user.dart';
import 'package:news_indo_app/features/guest/domain/usecase/sign_in_with_google.dart';
import 'package:news_indo_app/features/guest/domain/usecase/sign_out.dart';

class LoginController extends GetxController {
  final SignInWithGoogle _signInWithGoogle;
  final GetCurrentUser _getCurrentUser;
  final SignOut _signOut;
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;
  LoginController(this._signInWithGoogle, this._getCurrentUser, this._signOut);

  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    _firebaseAuth.authStateChanges().listen((firebaseUser) {
      checkAuthStatus();
    });
    checkAuthStatus();
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    errorMessage.value = '';
    final result = await _signInWithGoogle.call();
    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        Get.snackbar(
          'Error',
          errorMessage.value,
          icon: Icon(Icons.info_outline, size: 18, color: Colors.white),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      },
      (user) {
        isLoading.value = false;
        currentUser.value = user;
        Get.offAllNamed(AppRoute.dashboard);
      },
    );
  }

  Future<void> checkAuthStatus() async {
    isLoading.value = true;
    final result = await _getCurrentUser.call();

    result.fold(
      (failure) {
        isLoading.value = false;
        errorMessage.value = failure.message;
        currentUser.value = null;
        Get.toNamed(AppRoute.main);
      },
      (user) {
        isLoading.value = false;
        currentUser.value = user;
        if (user != null) {
          Get.offAllNamed(AppRoute.dashboard);
        } else {
          Get.toNamed(AppRoute.main);
        }
      },
    );
  }

  Future<void> signOut() async {
    final result = await _signOut.call();
    result.fold(
      (failure) {
        Get.snackbar(
          'Error',
          failure.message,
          icon: Icon(Icons.info_outline, size: 18, color: Colors.white),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      },
      (_) {
        currentUser.value = null;
        Get.toNamed(AppRoute.main);
      },
    );
  }
}
