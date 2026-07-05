import 'package:flutter/material.dart';
import 'package:filmology/core/error/error_message.dart';

class AppErrorMessages {
  static Widget noData() {
    return const ErrorMessage(message: "No data available at the moment.");
  }

  static Widget fetchError(String error, {VoidCallback? onRetry}) {
    return ErrorMessage(
      message: "Something went wrong: $error", 
      onRetry: onRetry,
    );
  }

  static Widget connectionError({VoidCallback? onRetry}) {
    return ErrorMessage(
      message: "Please check your internet connection and try again.", 
      onRetry: onRetry,
    );
  }
}