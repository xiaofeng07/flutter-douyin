import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtils {
  static TransitionBuilder init() {
    return EasyLoading.init();
  }

  static show() {
    EasyLoading.show(status: 'loading...');
  }

  static showProgress(double progress) {
    EasyLoading.showProgress(progress, status: 'downloading...');
  }

  static showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  static showError(String message) {
    EasyLoading.showError(message);
  }

  static showInfo(String message) {
    EasyLoading.showInfo('Useful Information.');
  }

  static showToast(String message, {
    Duration? duration,
    EasyLoadingToastPosition? toastPosition,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    EasyLoading.showToast(message, duration: duration,
        toastPosition: toastPosition,
        maskType: maskType,
        dismissOnTap: dismissOnTap);
  }

  static dismiss() {
    EasyLoading.dismiss();
  }


}